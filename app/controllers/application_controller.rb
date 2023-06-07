class ApplicationController < ActionController::Base
  before_action :call_debugger

  private

  def call_debugger
    # debugger
  end
end
