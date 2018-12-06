require "rails_helper"

describe "Favoriteering", :js, :vcr do
  it "stores a favorite when a page is favorited" do
    # Since the test environment is using a dirty database, it's hard to make sure that a unique page is being visited
    # to test that the data/link toggling is working properly, so all of the testing has been mashed into a single spec
    # for this.

    visit root_path
    click_link "Like this Page"

    # Link should toggle
    expect(page).to have_link "Unlike this Page"

    # Refresh the page and make sure the 'favorite' stuck
    visit root_path
    expect(page).to have_link "Unlike this Page"

    # Toggle back
    click_link "Unlike this Page"
    expect(page).to have_link("Like this Page")

    # Refresh and confirm
    visit root_path
    expect(page).to have_link("Like this Page")
  end
end
