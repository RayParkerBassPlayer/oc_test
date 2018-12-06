require "rails_helper"

describe "Shingle Browsing with Zip", :vcr, :js do
  it "begs for a zip code if the non-zip route is requested" do
    visit shingles_path

    expect(page).to have_content("Please enter a zip code to show available shingles in your area.")
  end

  it "does not beg for zip if zip routed is requested" do
    visit shingles_by_zip_path(Zip.first)

    expect(page).not_to have_content("Please enter a zip code to show available shingles in your area.")
  end

  describe "blank zip field" do
    it "uses zipless route when shingle selected" do
      shingle = ShingleConnection.shingles.last

      visit shingles_path

      fill_in "zip", :with => ""
      select shingle["proper_name"], :from => "shingle-names"

      expect(current_path).to eq shingles_path(shingle["uid"])
    end

    it "uses zipless route when color selected" do
      shingle = ShingleConnection.shingles.first
      color = ShingleConnection.shingle_colors(shingle).last

      visit shingles_path

      fill_in "zip", :with => ""
      find(%Q[img[data-color-id='#{color["uid"]}']]).click

      expect(current_path).to eq shingles_path(shingle["uid"], color["uid"])
    end
  end

  it "uses shingle_by_zip route with no color on shingle change" do
    shingle = ShingleConnection.shingles.last
    zip = Zip.first.code

    visit root_path

    fill_in "zip", :with => zip
    select shingle["proper_name"], :from => "shingle-names"

    expect(current_path).to eq shingles_by_zip_path(zip, shingle["uid"])
  end

  it "uses shingle_by_zip route with color on color change" do
    shingle = ShingleConnection.shingles.first
    new_color = ShingleConnection.shingle_colors(shingle).last
    zip = Zip.last.code

    visit root_path

    fill_in "zip", :with => zip
    find(%Q[img[data-color-id='#{new_color["uid"]}']]).click

    expect(current_path).to eq shingles_by_zip_path(zip, shingle["uid"], new_color["uid"])
  end
end
