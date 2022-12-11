class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    @authorisation = Authorisation.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    if @authorisation
      render text: "Welcome back #{@authorisation.user.name}! You have already signed up."
    else
      user = User.new(name: auth_hash['name'], email: auth_hash['email'])
      user.authorisations.build(provider: auth_hash['provider'], uid: auth_hash['uid'])
      user.save

      render text: "Hi #{user.name}! You've signed up."
    end

  end

  def failure
    raise request.env['omniauth.error'] # Your own error handling should be placed here.
  end

  def destroy
    session[:user_auth_id] = nil
    render :text => "You've logged out!"
  end
end