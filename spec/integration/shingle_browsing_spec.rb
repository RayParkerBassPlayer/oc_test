require "rails_helper"


describe "Shingle Browsing" do
  it "has a dropdown with all of the available shingle names", :vcr do
    shingle_names = ShingleConnection.shingles.collect{|shingle| shingle["proper_name"]}.sort
    visit root_path

    expect(page.all("select#shingle-names option").collect(&:text)).to eq shingle_names
  end
end
