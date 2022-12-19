class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new = render :new

  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to mods_path, notice: "Signed in as #{@user.name}"
  end

  def failure = redirect_to login_path, error: 'Access not given.'

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Sign out successful.'
  end
end