class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_form_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    # render :text => "You've logged out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end