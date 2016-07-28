module CypressValidationUtility
  module Validate
    class ValuesetCategoryValidator
      include HealthDataStandards::Validate::BaseValidator

      CATEGORY_MAP = {'Attribute' => 'attribute',
                      'Communication' => 'Communication',
                      'Condition/Diagnosis/Problem' => 'Diagnosis',
                      'Device' => 'Device',
                      'Diagnostic Study' => 'Diagnostic Study',
                      'Encounter' => 'Encounter',
                      'Family History' => 'Family History',
                      'Functional Status' => 'Functional Status',
                      'Immunization' => 'Immunization',
                      'Individual Characteristic' => 'Patient Characteristic',
                      'Intervention' => 'Intervention',
                      'Laboratory Test' => 'Laboratory Test',
                      'Medication' => 'Medication',
                      'Physical Exam' => 'Physical Exam',
                      'Procedure' => 'Procedure',
                      'Risk Category/Assessment' => 'Risk Category Assessment',
                      'Substance' => 'Substance',
                      'Transfer of Care' => 'Transfer'}
      def initialize(measure_ids, bundle_id)
        @bundle_id = bundle_id
        @name = "Valueset Category Validator"
        @hqmf_qrda_oid_map = HealthDataStandards::Export::QRDA::EntryTemplateResolver.hqmf_qrda_oid_map
        @measure_cms_ids = []
        if measure_ids && !measure_ids.empty?
          @measure_cms_ids = HealthDataStandards::CQM::Measure.where(:hqmf_id.in => measure_ids).distinct(:cms_id)
        end
      end
      
      def validate(file, options={})
        @errors = []
        doc = get_document(file)
        data_element_array = extract_valuesets(doc)
        verify_vs_categories(data_element_array, options)
        @errors
      end

      def extract_valuesets(doc, options={})
        data_element_array = []
        # Get array of all valuesets in the document
        valuesets = doc.xpath("//*[@sdtc:valueSet]")
        valuesets.each do |value_set|
          value_set_hash = {}
          template_ids = []
          if !['code', 'value', 'translation'].include? value_set.name
            value_set_hash['vset'] = value_set.at_xpath("@sdtc:valueSet").value
          else
            # all of the template ids for the entry
            template_node = value_set
            while template_node.name != 'entry'
              template_node = template_node.parent
              template_id_nodes = template_node.xpath(".//cda:templateId")
              template_id_nodes.each do |template_id_node|
                template_ids << template_id_node.at_xpath("@root").value
              end
            end
            # Hash of the value set with the template ids associated with it
            value_set_hash['vset'] = value_set.at_xpath("@sdtc:valueSet").value
            value_set_hash['template_ids'] = template_ids
            value_set_hash['path'] = value_set.path
          end
          data_element_array << value_set_hash
        end
        data_element_array
      end

      def verify_vs_categories(data_elements, options={})
        # for each hash of valuesets with their array of template ids
        data_elements.each do |data_element|
          result = false
          qrda_oids = data_element['template_ids'] || []
          value_set_oid = data_element['vset']
          vset = HealthDataStandards::SVS::ValueSet.where(oid: value_set_oid, bundle_id: @bundle_id)
          if vset.size > 0
            # all of the categories associated with the valueset, each measure may have different category
            valueset_categories = vset.first.categories
            # only run check if valueset has categories. compatibility with older bundles
            if valueset_categories.nil?
              @errors << build_error("Value Set #{value_set_oid} was not checked for template/category alignment.", data_element['path'], options[:file_name])
              result = true
            else
              result = category_appropriate_for_vs(valueset_categories, qrda_oids)
            end
          end
          unless result
            if qrda_oids
              @errors << build_error("Value Set #{value_set_oid} has a different category than Templates #{qrda_oids}", data_element['path'], options[:file_name])
            else
              @errors << build_error("Value Set #{value_set_oid} has a different category than 'Attribute'", data_element['path'], options[:file_name])
            end
          end
        end
      end

      def category_appropriate_for_vs(valueset_categories, qrda_oids)
        categories = []
        valueset_categories.each do |cms_id, category_list|
          # Add the categories if the cms_id matches
          categories = categories + category_list if @measure_cms_ids.include? cms_id
        end
        categories = categories.uniq
        # return true if there aren't any qrda templates associated with the valueset, and valueset is of type attribute
        if qrda_oids.nil?
          return categories.include?('Attribute') ? true : false
        end
        # loops though template ids to see if any match the category of the valueset
        qrda_oids.each do |qrda_oid|
          oid_tuples = @hqmf_qrda_oid_map.find_all {|map_tuple| map_tuple['qrda_oid'] == qrda_oid }
          oid_tuples.each do |oid_tuple|
            categories.each do |category|
              if oid_tuple['hqmf_name'].include?(CATEGORY_MAP[category])
                # if one of the template ids is the right category, true
                return true
              end
            end
          end
        end
        false
      end
    end
  end
end
