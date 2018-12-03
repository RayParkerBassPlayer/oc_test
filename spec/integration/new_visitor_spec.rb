require "rails_helper"

describe "New Visitor Expectations" do
  let(:page_title) {"Owens Corning Developer Test"}

  it "welcomes a new visitor", :vcr do
    visit root_path
    expect(page.title).to eq(page_title)
  end

  it "welcomes a new visitor in a JS-enabled test browser", :js, :vcr do
    visit root_path
    expect(page.title).to eq(page_title)
  end
end
