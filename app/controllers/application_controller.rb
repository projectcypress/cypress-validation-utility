require "logger"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Exception, with: :global_handle_exception

  def error_logger
    @@error_logger ||= Logger.new(::File.new("log/error.log","a+"))
  end

  def global_handle_exception(exception)
    error_logger.error exception.message
    error_logger.error exception.backtrace.join("\n")

    flash[:notice] = exception.message
    render template:"errors/500", status: 500 and return
  end

end
