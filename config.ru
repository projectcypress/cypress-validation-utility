# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)


::Logger.class_eval { alias :write :'<<' }
access_log = ::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','access.log')
access_logger = ::Logger.new(access_log)


use ::Rack::CommonLogger, access_logger




run Rails.application
