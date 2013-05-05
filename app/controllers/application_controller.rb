class ApplicationController < ActionController::Base
  protect_from_forgery

  # Devise authentication
  before_filter :authenticate_user!
end
