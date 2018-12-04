require "rails_helper"
require "shingle_connection"

describe ShingleConnection, :vcr do
  it "retrieves a list of singles" do
    response = ShingleConnection.shingles

    expect(response).to be_a(Array)
  end

  it "retrieves a list of singles with a zip code" do
    response = ShingleConnection.shingles(:zip => "43551")

    expect(response).to be_a(Array)
  end

  it "extracts an ordered list of colors for a given shingle"
end
