require "rails_helper"

describe "Reports" do
  let(:user_name){"admin"}
  let(:password){"nimda"}

  it "lists all of the favorite entries" do
    # Make sure that at least a few faves are in the db
    create_list(:favorite, 5)
    favorites = Favorite.all

    log_in(user_name, password)

    click_link "All Favorite Entries"

    favorites.each do |fave|
      expect(page).to have_selector("#favorite_#{fave.id}")
    end
    
  end
end
