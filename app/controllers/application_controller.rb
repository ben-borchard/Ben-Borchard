class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_permissions

  def require_permissions
  	if (not(user_is_admin?))
    	render 'shared/access_denied'
    	return false
    end

  end

end
