module Admin
  class AdminController < ApplicationController
    before_action :user_logged_in?

    def current_user
      @__current_user ||= session[:current_user]
    end

    helper_method :current_user

    def current_user?
      current_user.present?
    end

    helper_method :current_user?

    def user_logged_in?
      if !current_user.present?
        redirect_to admin_root_path
      end
    end

    def log_user_out
      @__current_user = nil
      session[:current_user] = nil
    end

    def log_user_in(user_id, password)
      if user_id == "admin" && password == "nimda"
        session[:current_user] = true
      else
        raise "Username and Password not recognized."
      end
    end
  end
end
