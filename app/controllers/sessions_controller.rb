class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
  def fbsignin
    store_oauth(env["omniauth.auth"])
    @temp = env["omniauth.auth"]
    current_user.facebook_token = @temp.credentials.token
    current_user.facebook_expire = @temp.credentials.expires_at
    current_user.update_attribute("facebook_token", @temp.credentials.token)
    current_user.update_attribute("facebook_expire", @temp.credentials.expires_at)
    
    redirect_to root_url
  end
  
  def fbsignout
    unless (current_user.facebook_token.blank?)
      current_user.update_attribute("facebook_token", "")
      current_user.update_attribute("facebook_expire", "")
    else
      redirect_to root_path
    end
  end
  
end