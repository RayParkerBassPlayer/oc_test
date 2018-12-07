require "rails_helper"

describe "Admin Login" do
  let(:user_name){"admin"}
  let(:password){"nimda"}

  it "shows log in form when logged out" do
    visit admin_root_path

    expect(page).to have_selector("#log-in-form")
  end

  it "does not show log in form when logged in" do
    log_in(user_name, password)

    expect(page).not_to have_selector("#log-in-form")
  end

  it "shows log in form after logging out" do
    visit admin_root_path
    expect(page).to have_selector("#log-in-form")

    log_in(user_name, password)
    expect(page).not_to have_selector("#log-in-form")

    log_out
    expect(page).to have_selector("#log-in-form")
  end
end
