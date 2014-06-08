class FacebookSessionsController < ApplicationController
  def create
    facebook_user = FacebookUser.from_omniauth(env["omniauth.auth"])
    #facebook_session[:user_id] = facebook_user.id
    redirect_to root_path
  end

  def destroy
    facebook_session[:user_id] = nil
    redirect_to root_path
  end
end