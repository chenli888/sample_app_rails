module FacebookSessionsHelper
    private
    def facebook_signed_in?
      @current_facebook_user ||= FacebookUser.find(session[:user_id]) if session[:user_id]
    end
end