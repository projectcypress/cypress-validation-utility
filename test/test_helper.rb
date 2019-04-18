require 'simplecov'
# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'rubygems'
require 'zip/zip'
require 'sucker_punch/testing/inline'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/setup'

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
end
