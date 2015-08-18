ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "rubygems"
require "zip/zip"

class ActiveSupport::TestCase


  def unzip_if_necessary(zipped_collection)

  	zipfile = File.join(Rails.root, 'test', 'fixtures', zipped_collection + ".zip")

  	folder = File.join(Rails.root, 'test', 'fixtures', zipped_collection)

  	return if Dir.exists? folder

  	Dir.mkdir folder

  	Zip::ZipFile.open(zipfile) do |content|
  		content.each do |file_entry|

  			dest_file = File.join(folder , file_entry.name)

  			file_entry.extract(dest_file)

  		end
  	end


  end


  def collection_fixtures(collection, *id_attributes)
    Mongoid.session(:default)[collection].drop
    Dir.glob(File.join(Rails.root, 'test', 'fixtures', collection, '*.json')).each do |json_fixture_file|
      fixture_json = JSON.parse(File.read(json_fixture_file), max_nesting: 250)
      id_attributes.each do |attr|

        if fixture_json[attr].nil?
          next
        end

        if fixture_json[attr].kind_of? Array
          fixture_json[attr] = fixture_json[attr].collect{|att| BSON::ObjectId.from_string(att)}
        else
          fixture_json[attr] = BSON::ObjectId.from_string(fixture_json[attr])
        end
      end

      if fixture_json["created_at"]
         fixture_json["created_at"] = Time.parse(fixture_json["created_at"] )
      end
      Mongoid.default_session[collection].insert(fixture_json)
    end
  end


end
