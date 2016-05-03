ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
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

  def unzip_if_necessary(zipped_collection)
    zipfile = File.join(Rails.root, 'test', 'fixtures', zipped_collection + ".zip")
    folder = File.join(Rails.root, 'test', 'fixtures', zipped_collection)

    return if Dir.exist? folder

    Dir.mkdir folder

    Zip::ZipFile.open(zipfile) do |content|
      content.each do |file_entry|
        dest_file = File.join(folder , file_entry.name)
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
      elsif k == 'created_at' || k == 'updated_at'
        json[k] = Time.parse(v).utc
      end
    end
    json
  end

  def collection_fixtures(*collections)
    collections.each do |collection|
      Mongoid.default_client[collection].drop
      Dir.glob(File.join(Rails.root, 'test', 'fixtures', collection, '*.json')).each do |json_fixture_file|
        fixture_json = JSON.parse(File.read(json_fixture_file), max_nesting: 250)
        map_bson_ids(fixture_json)
        Mongoid.default_client[collection].insert_one(fixture_json)
      end
    end
  end
end
