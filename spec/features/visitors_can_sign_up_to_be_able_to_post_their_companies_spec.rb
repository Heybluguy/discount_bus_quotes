require 'rails_helper'

describe 'as a user i can see an option to sign up' do
  describe 'when i am on the root path' do
    scenario 'i can sign up with a username and password' do
      visit '/'

      click_on "Sign Up to Be a User"

      expect(current_path).to eq(new_user_path)

      fill_in "user[name]", with: "ilana"
      fill_in "user[email]", with: "funbucket"
      fill_in "user[password]", with: "123"

      click_on "Create User"

      expect(page).to have_content("Welcome, ilana")
    end
  end
end