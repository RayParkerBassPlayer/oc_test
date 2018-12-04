require "shingle_connection"

class HomeController < ApplicationController
  def shingles
    zip = params["zip"] || "43659"
    @shingles = ShingleConnection.shingles(:zip => zip)

    @current_shingle = params["shingle"].present? ? @shingles.find{|shingle| shingle["uid"] == params["shingle"]} : @shingles.first
    @current_color = @current_shingle["shingle_colors"].find{|color| color["uid"] == params["color"]} || @current_shingle["shingle_colors"].first
  end
end
