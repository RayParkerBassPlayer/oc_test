require "rails_helper"

describe "Reporting Dashboard" do
  let(:user_name){"admin"}
  let(:password){"nimda"}

  it "shows log in form when logged out" do
    visit admin_root_path

    expect(page).to have_selector("#user_name")
    expect(page).to have_selector("#password")
  end

  it "does not show log in form when logged in" do
    log_in

    expect(page).not_to have_selector("#user_name")
    expect(page).not_to have_selector("#password")
  end

  it "shows log in form after logging out" do
    visit admin_root_path

    expect(page).to have_selector("#user_name")
    expect(page).to have_selector("#password")

    log_in

    expect(page).not_to have_selector("#user_name")
    expect(page).not_to have_selector("#password")

    log_out

    expect(page).to have_selector("#user_name")
    expect(page).to have_selector("#password")
  end

  it "lists all of the favorite entries" do
    log_in

    click_link "All Favorite Entries"
  end

  it "lists all of the favorited urls with totals" do
    log_in

    click_link "All Favorite Totals"
  end
end
