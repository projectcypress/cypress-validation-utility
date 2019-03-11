# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'rubygems'
require 'zip/zip'
require 'sucker_punch/testing/inline'

class ActiveSupport::TestCase
  def drop_database
    Mongoid::Config.purge!
    # purge the database instead of dropping it
    # because dropping it literally deletes the file
    # which then has to be recreated (which is slow)
  end

  def get_document(input)
    content_str = case input
                  when File
                    input.read
                  when Nokogiri::XML::Document
                    return input
                  else
                    input
                  end

    document = Nokogiri::XML(content_str, &:strict)
    document.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    document.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    document
  end

  def unzip_if_necessary(zipped_collection)
    zipfile = Rails.root.join('test', 'fixtures', zipped_collection + '.zip')
    folder = Rails.root.join('test', 'fixtures', zipped_collection)

    return if Dir.exist? folder

    Dir.mkdir folder

    Zip::ZipFile.open(zipfile) do |content|
      content.each do |file_entry|
        dest_file = File.join(folder, file_entry.name)
        file_entry.extract(dest_file)
      end
    end
  end

  def value_or_bson(v)
    if v.is_a? Hash
      if v['$oid']
        BSON::ObjectId.from_string(v['$oid'])
      else
        map_bson_ids(v)
      end
    else
      v
    end
  end

  def map_array(arr)
    ret = []
    arr.each do |v|
      ret << value_or_bson(v)
    end
    ret
  end

  def map_bson_ids(json)
    json.each_pair do |k, v|
      if v.is_a? Hash
        json[k] = value_or_bson(v)
      elsif v.is_a? Array
        json[k] = map_array(v)
      elsif %w[created_at updated_at].include?(k)
        json[k] = Time.parse(v).utc
      end
    end
    json
  end

  def collection_fixtures(*collections)
    collections.each do |collection|
      Mongoid.default_client[collection].drop
      Dir.glob(Rails.root.join('test', 'fixtures', collection, '*.json')).each do |json_fixture_file|
        fixture_json = JSON.parse(File.read(json_fixture_file), max_nesting: 250)
        map_bson_ids(fixture_json)
        Mongoid.default_client[collection].insert_one(fixture_json)
      end
    end
  end

  def load_library_functions
    Dir.glob(Rails.root.join('test', 'fixtures', 'library_functions', '*.js')).each do |js_path|
      fn = "function () {\n #{File.read(js_path)} \n }"
      name = File.basename(js_path, '.js')
      Mongoid.default_client['system.js'].replace_one({ '_id' => name },
                                                      { '_id' => name,
                                                        'value' => BSON::Code.new(fn) }, upsert: true)
    end
  end
end
