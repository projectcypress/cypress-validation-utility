var root = this;


root.emitResult = root.emitResult || function(value) {
  //if (value['IPP'] > 0) emit(ObjectId(), value);
  emit(ObjectId(), value);
}

root.map = function(record, population, denominator, numerator, exclusion, denexcep, msrpopl, msrpoplex, observ, occurrenceId, isContinuousVariable, stratification, variables, numex) {
  var value = {IPP: 0, patient_id: record._id,
               medical_record_id: record.medical_record_number,
               first: record.first, last: record.last, gender: record.gender,
               birthdate: record.birthdate, test_id: record.test_id,
               provider_performances: record.provider_performances,
               race: record.race, ethnicity: record.ethnicity, languages: record.languages,
               payer: extract_payer(record)};

  value.measure_id = hqmfjs.hqmf_id
  value.sub_id = hqmfjs.sub_id
  value.nqf_id = hqmfjs.nqf_id
  value.effective_date = hqmfjs.effective_date;
  value.test_id = hqmfjs.test_id;

  if (isContinuousVariable) {
    value = calculateCV(record, population, msrpopl, msrpoplex, observ, occurrenceId, value, stratification, variables)
  } else {
    value = calculate(record, population, denominator, numerator, exclusion, denexcep, occurrenceId, value, stratification, variables, numex)
  }

  if (typeof Logger != 'undefined') {
    value['logger'] = Logger.logger
    value['rationale'] = Logger.rationale
  }

  if (value.provider_performances) {
    var tmp = [];
    for(var i=0; i<value.provider_performances.length; i++) {
      var performance = value.provider_performances[i];
      if ((performance['start_date'] <= hqmfjs.effective_date || performance['start_date'] == null) && (performance['end_date'] >= hqmfjs.effective_date || performance['end_date'] == null))
        tmp.push(performance);
    }
    if (tmp.length == 0) tmp = null;
    value.provider_performances = tmp;
  } else {
    value.provider_performances = null;
  }

  emitResult(value);
  //emit(ObjectId(), value);
};

root.extract_payer = function(record) {
  var payer = {};
  if(record.insurance_providers && record.insurance_providers.length > 0){
    var ip = record.insurance_providers[0];
    if(ip.codes.SOP && ip.codes.SOP.length >0){
      payer["code"] = ip.codes.SOP[0];
      payer["codeSystem"] = "SOP";
    }
  }
  return payer;
};

root.calculate = function(record, population, denominator, numerator, exclusion, denexcep, occurrenceId, value, stratification, variables, numex) {

  finalSpecifics = {};
  value = _.extend(value, {IPP: 0, DENOM: 0, NUMER: 0, DENEXCEP: 0, DENEX: 0, NUMEX: 0, antinumerator: 0});

  // For the moment, we are doing this to allow for the disabling of storage of finalSpecifics in Mongo.
  // At some point, it may make more sense to move this to its own variable, rather than using enable_rationale
  // For example, if Cypress starts running into finalSpecifics size issues.
  if (Logger.enable_rationale) {
    value = _.extend(value, {finalSpecifics: finalSpecifics});
  }

  var strat;
  var ipp;
  var validStrat = false;
  if(stratification) {
    strat = stratification()
    hqmf.SpecificsManager.storeFinal('STRAT', strat, finalSpecifics);
    value.STRAT = hqmf.SpecificsManager.countUnique(occurrenceId, strat);
    if (hqmf.SpecificsManager.validate(strat)) {
      ipp = hqmf.SpecificsManager.intersectSpecifics(population(), strat, occurrenceId);
      validStrat = true;
    }
  } else {
    ipp = population();
  }

  if (ipp) {
    hqmf.SpecificsManager.storeFinal('IPP', ipp, finalSpecifics);
    if (hqmf.SpecificsManager.validate(ipp)) {
      value.IPP = hqmf.SpecificsManager.countUnique(occurrenceId, ipp);
      // if we have a stratification that does not reference an episode of care then we need to take the IPP count
      if (validStrat && value.STRAT < value.IPP) value.STRAT = value.IPP;
      var denom = hqmf.SpecificsManager.intersectSpecifics(denominator(), ipp, occurrenceId);
      hqmf.SpecificsManager.storeFinal('DENOM', denom, finalSpecifics);
      if (hqmf.SpecificsManager.validate(denom)) {

        value.DENOM = hqmf.SpecificsManager.countUnique(occurrenceId, denom);
        var exclusions = hqmf.SpecificsManager.intersectSpecifics(exclusion(), denom, occurrenceId);
        hqmf.SpecificsManager.storeFinal('DENEX', exclusions, finalSpecifics);
        if (hqmf.SpecificsManager.validate(exclusions)) {
          value.DENEX = hqmf.SpecificsManager.countUnique(occurrenceId, exclusions);
          denom = hqmf.SpecificsManager.exclude(occurrenceId, denom, exclusions);
        }

      }
      // DENEX is a subset of the denominator, so we should set the specifics before the exclusion
      // hqmf.SpecificsManager.storeFinal('DENOM', denom, finalSpecifics);

      // we need to check the denominator again to make sure we still have viable candidates after
      // exclusions have been removed
      if (hqmf.SpecificsManager.validate(denom)) {
        var numer = hqmf.SpecificsManager.intersectSpecifics(numerator(), denom, occurrenceId);
        hqmf.SpecificsManager.storeFinal('NUMER', numer, finalSpecifics);
        if (hqmf.SpecificsManager.validate(numer)) {
          value.NUMER = hqmf.SpecificsManager.countUnique(occurrenceId, numer);
          var numeratorExclusions = hqmf.SpecificsManager.intersectSpecifics(numex(), numer, occurrenceId);
          hqmf.SpecificsManager.storeFinal('NUMEX', numeratorExclusions, finalSpecifics);
          if (hqmf.SpecificsManager.validate(numeratorExclusions)) {
            value.NUMEX = hqmf.SpecificsManager.countUnique(occurrenceId, numeratorExclusions);
            numer = hqmf.SpecificsManager.exclude(occurrenceId, numer, numeratorExclusions);
          }
        }

        var excep = hqmf.SpecificsManager.intersectSpecifics(denexcep(), denom, occurrenceId);
        hqmf.SpecificsManager.storeFinal('DENEXCEP', excep, finalSpecifics);
        if (hqmf.SpecificsManager.validate(excep)) {
          excep = hqmf.SpecificsManager.exclude(occurrenceId, excep, numer);
          value.DENEXCEP = hqmf.SpecificsManager.countUnique(occurrenceId, excep);
          denom = hqmf.SpecificsManager.exclude(occurrenceId, denom, excep);
        }
        value.antinumerator = value.DENOM-value.NUMER;
      }

    }
  }

  // Adding a separate set of computations for variables. This is because the
  // logic view displays non-occurrenced variables. However, these are not always
  // a part of the actual logic computation. This means that they don't get
  // colored. By adding in a separate set of computations for variables, we
  // guarantee that they'll be colored.
  if(variables){
    variables();
  }
  return value;
};

root.calculateCV = function(record, population, msrpopl, msrpoplex, observ, occurrenceId, value, stratification, variables) {
  finalSpecifics = {};
  value = _.extend(value, {MSRPOPL: 0, MSRPOPLEX: 0, values: []});

  // For the moment, we are doing this to allow for the disabling of storage of finalSpecifics in Mongo.
  // At some point, it may make more sense to move this to its own variable, rather than using enable_rationale
  // For example, if Cypress starts running into finalSpecifics size issues.
  if (Logger.enable_rationale) {
    value = _.extend(value, {finalSpecifics: finalSpecifics});
  }

  var strat;
  var ipp;
  var validStrat = false;
  if(stratification) {
    strat = stratification()
    hqmf.SpecificsManager.storeFinal('STRAT', strat, finalSpecifics);
    value.STRAT = hqmf.SpecificsManager.countUnique(occurrenceId, strat);
    if (hqmf.SpecificsManager.validate(strat)) {
      ipp = hqmf.SpecificsManager.intersectSpecifics(population(), strat, occurrenceId);
      validStrat = true;
    }
  } else {
    ipp = population();
  }


  if (ipp) {
    hqmf.SpecificsManager.storeFinal('IPP', ipp, finalSpecifics);
    if (hqmf.SpecificsManager.validate(ipp)) {
      value.IPP = hqmf.SpecificsManager.countUnique(occurrenceId, ipp);
      // if we have a stratification that does not reference an episode of care then we need to take the IPP count
      if (validStrat && value.STRAT < value.IPP) value.STRAT = value.IPP;
      var measurePopulation = hqmf.SpecificsManager.intersectSpecifics(msrpopl(), ipp, occurrenceId);
      hqmf.SpecificsManager.storeFinal('MSRPOPL', measurePopulation, finalSpecifics);
      if (hqmf.SpecificsManager.validate(measurePopulation)) {
        value.MSRPOPL = hqmf.SpecificsManager.countUnique(occurrenceId, measurePopulation);
        
        var measurePopulationExclusions = hqmf.SpecificsManager.intersectSpecifics(msrpoplex(), measurePopulation, occurrenceId);
        hqmf.SpecificsManager.storeFinal('MSRPOPLEX', measurePopulationExclusions, finalSpecifics);
        if (hqmf.SpecificsManager.validate(measurePopulationExclusions)) {
          value.MSRPOPLEX = hqmf.SpecificsManager.countUnique(occurrenceId, measurePopulationExclusions);
          // Remove from measure population if in measure population exclusion.
          measurePopulation = hqmf.SpecificsManager.exclude(occurrenceId, measurePopulation, measurePopulationExclusions);
        }

        var observations = observ(measurePopulation.specificContext);
        value.values = observations;
      }
    }
  }

  // Adding a separate set of computations for variables. This is because the
  // logic view displays non-occurrenced variables. However, these are not always
  // a part of the actual logic computation. This means that they don't get
  // colored. By adding in a separate set of computations for variables, we
  // guarantee that they'll be colored.
  if(variables){
    variables();
  }
  return value;
};