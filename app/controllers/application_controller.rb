class ApplicationController < ActionController::Base
  protect_from_forgery

  # Devise authentication
  before_filter :authenticate_user!

  # CanCan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
