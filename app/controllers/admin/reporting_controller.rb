module Admin
  class ReportingController < AdminController
    skip_before_action :user_logged_in?,  :only => [:index, :log_in]

    def index

    end

    def log_in
      log_user_in(params[:user_name], params[:password])

      redirect_to admin_reporting_path
    end

    def log_out
      log_user_out

      redirect_to admin_reporting_path
    end

    def all_favorites
      @favorites = Favorite.order(:created_at => :desc).all
    end

    def favorite_totals
      @favorites = Favorite.order(:shingle, :color).group(:shingle, :color).count
    end
  end
end
