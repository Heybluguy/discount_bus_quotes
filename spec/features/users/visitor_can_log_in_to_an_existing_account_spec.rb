require 'rails_helper'

describe 'as a visitor i can log in to an existing account' do
  describe 'when i am on the root path' do
    scenario 'i can log in to my existing account with email and password' do
      user = create(:user)

      visit '/'

      click_on "I Already Have An Account"
      fill_in "email", with: user.email
      fill_in "password", with: user.password

      click_on "Log In"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.name}")
      expect(page).to have_content("Logout")
    end
  end

end