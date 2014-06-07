class FacebookSessionsController < ApplicationController
  def create
    facebook_user = FacebookUser.from_omniauth(env["omniauth.auth"])
    facebook_session[:user_id] = user.id
  end

  def destroy
    facebook_session[:user_id] = nil
  end
end