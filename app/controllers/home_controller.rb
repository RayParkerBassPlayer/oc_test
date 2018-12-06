require "shingle_connection"

class HomeController < ApplicationController
  def shingles
    if params[:zip].blank?
      flash.now[:notice] = "Please enter a zip code to show available shingles in your area."
    end

    @current_zip = Zip.find("43659")
    default_zip = @current_zip

    @favorited = Favorite.exists?(:url => request.path, :ip => request.ip)

    begin
      if params[:zip].present?
        @current_zip = Zip.find(params[:zip])
      end
    rescue => e
      @current_zip = default_zip
      flash.now[:error] = "Zip code not found. (#{e})"
    end

    @shingles = ShingleConnection.shingles(:zip => @current_zip.code)

    @current_shingle = params["shingle"].present? ? @shingles.find { |shingle| shingle["uid"] == params["shingle"] } : @shingles.first
    @current_color = @current_shingle["shingle_colors"].find { |color| color["uid"] == params["color"] } || @current_shingle["shingle_colors"].first
  end

  def zip_updated
    if params[:zip].present?
      redirect_to(shingles_by_zip_path(params[:zip], params[:shingle], params[:color]))
    else
      redirect_to(shingles_path(params[:shingle], params[:color]))
    end
  end

  def page_favorited
    Favorite.add(params[:url], request.ip)
    Rails.logger.info("#{params[:url]} favorited.")

    render :plain => "OK"
  end

  def page_unfavorited
    Favorite.find_by(:url => params[:url], :ip => request.ip).destroy
    Rails.logger.info("#{params[:url]} unfavorited.")

    render :plain => "OK"
  end
end
