class ApplicationController < ActionController::Base
  def current_user; 'default_user'; end
  def custom_current_user; 'custom_user'; end
  def nil_current_user; nil; end
end
