require 'rails_helper'

describe 'as a visitor i can see an option to sign up' do
  describe 'when i am on the root path' do
    scenario 'i can sign up with a email and password' do
      visit '/'

      click_on "Sign Up to Be a User"

      expect(current_path).to eq(new_user_path)

      fill_in "user[name]", with: "Scott Lang"
      fill_in "user[email]", with: "Antman@marvel.com"
      fill_in "user[password]", with: "Pym Technologies"

      click_on "Create User"

      expect(page).to have_content("Welcome, Scott Lang")
    end
  end
end