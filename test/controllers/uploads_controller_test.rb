require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    unzip_if_necessary('measures')
    collection_fixtures('measures', 'bundles')
    BUNDLES["2016"] ||= HealthDataStandards::CQM::Bundle.find_by(version: "2.7.0")
  end

  test "upload single valid xml" do
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/0_AMI_ADULT_A.xml"), "text/xml")

    post "create", :file => file, :year => "none" , :file_type => "cat1_r2", :program => "none" 

    assert_response :success

    #replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert( response_body.include?("No errors found") , "Response for valid XML does not include \"No errors found\"" )
  end

  test "upload single xml with errors" do
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/5_ASTHMA_A_with_errors.xml"), "text/xml")

    post "create", :file => file, :year => "none" , :file_type => "cat1_r2", :program => "none" 

    assert_response :success

    #replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert( response_body.include?("78 errors found") , "Reponse for XML with errors does not include \"78 errors found\"" )
  end

  test "upload single broken xml" do
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/invalid_xml.xml"), "text/xml")

    post "create", :file => file, :year => "none" , :file_type => "cat1_r2", :program => "none"

    assert_response(400 , "Invalid XML page response not 400 status")
    assert_not_empty( flash[:notice] , "No flash notice in 400 page")

    assert( @response.body.include?("Unable to evaluate file due to malformed XML content:") , "Response for broken XML does not include invalid XML notice." )
  end

  test "upload zip file" do
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/qrda_subset.zip"), "application/zip")

    post "create", :file => file, :year => "none" , :file_type => "cat1_r2", :program => "none"

    assert_response :success

    #replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert( response_body.include?("No errors found") , "Reponse for zip file does not include \"No errors found\"" )
  end
end
