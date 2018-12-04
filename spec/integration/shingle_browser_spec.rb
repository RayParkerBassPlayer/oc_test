require "rails_helper"
require "shingle_connection"

describe "Shingle Browser", :js, :vcr do
  let(:shingles) { ShingleConnection.shingles }

  describe "shingle selection" do
    it "updates the shingle title" do
      shingle_to_view = shingles.last["proper_name"]

      visit root_path
      select shingle_to_view, :from => "shingle-names"

      expect(find("#shingle-name").text).to eq shingle_to_view
    end
  end

  describe "color selection" do
    it "shows the selected swatch as being selected"
    it "updates the main shingle image on mouse hover over color"
    it "updates the main shingle image on color selection"
  end
end
