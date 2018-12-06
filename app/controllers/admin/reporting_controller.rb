module Admin
  class ReportingController < AdminController
    skip_before_action :user_logged_in?,  :only => [:index, :log_in]

    def index
      a = 9
    end

    def log_in
      log_user_in(params[:user_name], params[:password])

      redirect_to admin_reporting_path
    end

    def log_out
      log_user_out

      redirect_to admin_reporting_path
    end
  end
end
