class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @mods = @user == current_user ? @user.mods : @user.mods.filter(&:public?)
  end
end
