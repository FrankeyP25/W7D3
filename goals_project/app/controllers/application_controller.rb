class ApplicationController < ActionController::Base
    #protect_from_forgery with :exception
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def require_user!
        redirect_to new_user_url if current_user.nil?
    end

    def require_no_user!
        #has to be defined
        redirect_to users_url if !current_user.nil?
    end
end
