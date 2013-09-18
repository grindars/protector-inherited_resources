class ApplicationController < ActionController::Base
  def current_user; 'default_user'; end
  def custom_current_user; 'custom_user'; end
end
