module Admin
  class AdminController < ApplicationController
    before_filter :require_administrator

    private

    def require_administrator
      raise CanCan::AccessDenied unless current_user.administrator?
    end
  end
end
