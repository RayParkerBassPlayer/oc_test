require "shingle_connection"

class HomeController < ApplicationController
  def index
    @shingles = ShingleConnection.shingles(:zip => "43659")
  end
end
