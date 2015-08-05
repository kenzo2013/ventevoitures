class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  protected
  
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to sign_in_url, notice: "Please log in"
      end
    end
      
      
  
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
