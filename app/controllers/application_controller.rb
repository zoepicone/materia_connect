class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery
  helper_method :current_user

  private

  def verify_logged_in
    return if current_user

    redirect_to login_path, alert: t('login_required')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
