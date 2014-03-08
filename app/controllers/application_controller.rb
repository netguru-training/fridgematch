class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:admin?)
  end

  rescue_from SecurityError do |exception|
    redirect_to root_url
  end
end
