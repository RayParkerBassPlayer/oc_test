require "shingle_connection"

class HomeController < ApplicationController
  def index
    @shingles = ShingleConnection.shingles(:zip => "43659").sort{|l, r| l["proper_name"] <=> r["proper_name"]}
  end
end
