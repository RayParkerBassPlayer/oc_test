require "rails_helper"

describe "New Visitor Expectations" do
  let(:welcome_message) {"Welcome to the Owens Corning developer test."}

  it "welcomes a new visitor" do
    visit root_path
    expect(page).to have_content(welcome_message)
  end

  it "welcomes a new visitor in a JS-enabled test browser", :js do
    visit root_path
    expect(page).to have_content(welcome_message)
  end
end
