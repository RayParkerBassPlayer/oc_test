require "shingle_connection"

class HomeController < ApplicationController
  def shingles
    @current_zip = nil

    begin
      @current_zip = params["zip"].present? ? Zip.find(params["zip"]) : Zip.find("43659")
    rescue => e
      raise "Zip code not found. (#{e})"
    end

    @shingles = ShingleConnection.shingles(:zip => @current_zip.code)

    @current_shingle = params["shingle"].present? ? @shingles.find { |shingle| shingle["uid"] == params["shingle"] } : @shingles.first
    @current_color = @current_shingle["shingle_colors"].find { |color| color["uid"] == params["color"] } || @current_shingle["shingle_colors"].first
  end
end
