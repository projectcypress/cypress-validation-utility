# frozen_string_literal: true
require 'logger'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception
  rescue_from Exception, :with =>
   :global_handle_exception

  def global_handle_exception(exception)
    ERROR_LOG.error exception.message
    ERROR_LOG.error exception.backtrace.join("\n")

    flash[:notice] = exception.message
    render(template: 'errors/500', status: 500) && return
  end
end
