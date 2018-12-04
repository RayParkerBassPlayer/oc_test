require "rails_helper"
require "shingle_connection"

describe ShingleConnection, :vcr do
  let(:shingles){ShingleConnection.shingles}

  it "retrieves a list of singles" do
    expect(shingles).to be_a(Array)
  end

  it "retrieves a list of singles with a zip code" do
    expect(shingles).to be_a(Array)
  end

  it "extracts an ordered list of colors for a given shingle" do
    expect(ShingleConnection.shingle_colors(shingles.first)).to be_an(Array)
  end
end
