# frozen_string_literal: true

Dir[File.dirname(__FILE__) + '/ext/*.rb'].each { |file| require file }.each { |file| require file }
Dir[File.dirname(__FILE__) + '/cypress/*.rb'].each { |file| require file }.each { |file| require file }
