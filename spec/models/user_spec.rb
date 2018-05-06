require 'rails_helper'

RSpec.describe User, type: :model do
  feature "User logs in and logs out" do

    # `js: true` spec metadata means this will run using the `:selenium`
    # browser driver configured in spec/support/capybara.rb
    scenario "with correct details", js: true do

      create(:user, email: "someone@example.tld", password: "somepassword")

      visit "/"

      click_link "Log in"
      expect(page).to have_css("h2", text: "Log in")
      expect(current_path).to eq(new_user_session_path)

      login "someone@example.tld", "somepassword"

      expect(page).to have_css("h1", text: "Welcome to RSpec Rails Examples")
      expect(current_path).to eq "/"
      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Hello, someone@example.tld"

      click_button "Log out"

      expect(current_path).to eq "/"
      expect(page).to have_content "Signed out successfully"
      expect(page).not_to have_content "someone@example.tld"

    end

    scenario "unconfirmed user cannot login" do

      create(:user, skip_confirmation: false, email: "e@example.tld", password: "test-password")

      visit new_user_session_path

      login "e@example.tld", "test-password"

      expect(current_path).to eq(new_user_session_path)
      expect(page).not_to have_content "Signed in successfully"
      expect(page).to have_content "You have to confirm your email address before continuing"
    end

    scenario "locks account after 10 failed attempts" do

      email = "someone@example.tld"
      create(:user, email: email, password: "somepassword")

      visit new_user_session_path

      (1..8).each do |attempt_num|
        login email, "wrong-password #{attempt_num}"
        expect(page).to have_content "Invalid email or password"
      end

      login email, "wrong-password 9"
      expect(page).to have_content "You have one more attempt before your account is locked"

      login email, "wrong-password 10"
      expect(page).to have_content "Your account is locked."

    end

    private

    def login(email, password)
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Log in"
    end

  end
end

feature "User registers" do

  scenario "with valid details" do

    visit "/"

    click_link "Sign up"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "Email", with: "tester@example.tld"
    fill_in "Password", with: "test-password"
    fill_in "Password confirmation", with: "test-password"
    click_button "Sign up"

    expect(current_path).to eq "/"
    expect(page).to have_content(
      "A message with a confirmation link has been sent to your email address.
      Please follow the link to activate your account."
    )

    open_email "tester@example.tld", with_subject: "Confirmation instructions"
    visit_in_email "Confirm my account"

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content "Your email address has been successfully confirmed."

    fill_in "Email", with: "tester@example.tld"
    fill_in "Password", with: "test-password"
    click_button "Log in"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Hello, tester@example.tld"
  end


  context "with invalid details" do

    before do
      visit new_user_registration_path
    end

    scenario "blank fields" do

      expect_fields_to_be_blank

      click_button "Sign up"

      expect(page).to have_error_messages "Email can't be blank",
        "Password can't be blank"
    end

    scenario "incorrect password confirmation" do

      fill_in "Email", with: "tester@example.tld"
      fill_in "Password", with: "test-password"
      fill_in "Password confirmation", with: "not-test-password"
      click_button "Sign up"

      expect(page).to have_error_message "Password confirmation doesn't match Password"
    end

    scenario "already registered email" do

      create(:user, email: "dave@example.tld")

      fill_in "Email", with: "dave@example.tld"
      fill_in "Password", with: "test-password"
      fill_in "Password confirmation", with: "test-password"
      click_button "Sign up"

      expect(page).to have_error_message "Email has already been taken"
    end

    scenario "invalid email" do

      fill_in "Email", with: "invalid-email-for-testing"
      fill_in "Password", with: "test-password"
      fill_in "Password confirmation", with: "test-password"
      click_button "Sign up"

      expect(page).to have_error_message "Email is invalid"
    end

    scenario "too short password" do

      min_password_length = 8
      too_short_password = "p" * (min_password_length - 1)
      fill_in "Email", with: "someone@example.tld"
      fill_in "Password", with: too_short_password
      fill_in "Password confirmation", with: too_short_password
      click_button "Sign up"

      expect(page).to have_error_message "Password is too short (minimum is 8 characters)"
    end

  end

  private

  def expect_fields_to_be_blank
    expect(page).to have_field("Email", with: "", type: "email")
    # These password fields don't have value attributes in the generated HTML,
    # so with: syntax doesn't work.
    expect(find_field("Password", type: "password").value).to be_nil
    expect(find_field("Password confirmation", type: "password").value).to be_nil
  end

end
