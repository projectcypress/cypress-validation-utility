module CypressValidationUtility
  module Validate
    class ProgramValidator
      include HealthDataStandards::Validate::BaseValidator

      def initialize(program)
        @name = 'CMS Program Validator'
        @program = program.upcase
      end

      def validate(file, options = {})
        errors = []

        @document = get_document(file)

        #xpath for informationRecipient, which is where CMS wants the code for the program
        prog = @document.at_xpath("//cda:informationRecipient/cda:intendedRecipient/cda:id/@extension")

        if !prog
          msg = "Expected to find program '#{@program}' but no program code was found."
          errors << build_error(msg, '/', options[:file_name])
        elsif prog.value != @program
          msg = "CMS Program code '#{prog.value}' does not match the expected code for program #{@program}."
          errors << build_error(msg, prog.parent.path, options[:file_name])
        end

        errors
      end
    end
  end
end