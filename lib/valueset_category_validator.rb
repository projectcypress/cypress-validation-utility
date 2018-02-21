# frozen_string_literal: true

module CypressValidationUtility
  module Validate
    class ValuesetCategoryValidator
      include HealthDataStandards::Validate::BaseValidator

      CATEGORY_MAP = { 'Attribute' => 'attribute',
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
                       'Assessment' => 'Assessment',
                       'Substance' => 'Substance',
                       'Transfer of Care' => 'Transfer' }.freeze
      def initialize(measure_ids, bundle_id)
        @bundle_id = bundle_id
        @name = 'Valueset Category Validator'
        @hqmf_qrda_oid_map = HealthDataStandards::Export::QRDA::EntryTemplateResolver.hqmf_qrda_oid_map
        @measure_cms_ids = []
        if measure_ids.present?
          @measure_cms_ids = HealthDataStandards::CQM::Measure.where(:hqmf_id.in => measure_ids).distinct(:cms_id)
        end
      end

      def validate(file, options = {})
        @errors = []
        doc = get_document(file)
        data_element_array = extract_valuesets(doc)
        verify_vs_categories(data_element_array, options)
        @errors
      end

      def extract_valuesets(doc, _options = {})
        data_element_array = []
        doc.xpath('//*[@sdtc:valueSet]').each do |value_set|
          value_set_hash = {}
          template_ids = []
          if %w[code value translation].include? value_set.name
            # all of the template ids for the entry
            template_node = value_set
            while template_node.name != 'entry'
              template_node = template_node.parent
              template_node.xpath('.//cda:templateId').each do |template_id_node|
                template_ids << template_id_node.at_xpath('@root').value
              end
            end
            # Hash of the value set with the template ids associated with it
            value_set_hash = { 'template_ids' => template_ids, 'path' => value_set.path }
          end
          value_set_hash['vset'] = value_set.at_xpath('@sdtc:valueSet').value
          data_element_array << value_set_hash
        end
        data_element_array
      end

      def verify_vs_categories(data_elements, options = {})
        # for each hash of valuesets with their array of template ids
        data_elements.each do |data_element|
          result = false
          qrda_oids = data_element['template_ids'] || []
          value_set_oid = data_element['vset']
          vset = HealthDataStandards::SVS::ValueSet.where(oid: value_set_oid, bundle_id: @bundle_id)
          unless vset.empty?
            result = find_vs_categories(vset, data_element['path'], qrda_oids, options[:file_name])
          end
          next if result
          @errors << if qrda_oids.blank?
                       build_error("Value Set #{value_set_oid} has a different category than 'Attribute'",
                                   data_element['path'], options[:file_name])
                     else
                       build_error("Value Set #{value_set_oid} has a different category than Templates #{qrda_oids}",
                                   data_element['path'], options[:file_name])
                     end
        end
      end

      def find_vs_categories(vset, data_element_path, qrda_oids, file_name)
        # all of the categories associated with the valueset, each measure may have different category
        valueset_categories = vset.first.categories
        # only run check if valueset has categories. compatibility with older bundles
        if valueset_categories.nil?
          @errors << build_error("Value Set #{vset.first.oid} was not checked for template/category alignment.",
                                 data_element_path, file_name)
          return true
        else
          category_appropriate_for_vs(valueset_categories, qrda_oids)
        end
      end

      def category_appropriate_for_vs(valueset_categories, qrda_oids)
        categories = []
        valueset_categories.each do |cms_id, category_list|
          # Add the categories if the cms_id matches
          categories += category_list if @measure_cms_ids.include? cms_id
        end
        categories = categories.uniq
        # return true if there aren't any qrda templates associated with the valueset, and valueset is of type attribute
        if qrda_oids.blank?
          return categories.include?('Attribute') ? true : false
        end
        # loops though template ids to see if any match the category of the valueset
        qrda_oids.each do |qrda_oid|
          oid_tuples = @hqmf_qrda_oid_map.find_all { |map_tuple| map_tuple['qrda_oid'] == qrda_oid }
          oid_tuples.each do |oid_tuple|
            categories.each do |category|
              # value set category is ok if it matches the hqmf type of the QRDA template, or if value set category is 'attribute'
              if oid_tuple['hqmf_name'].include?(CATEGORY_MAP[category]) || category == 'Attribute'
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
