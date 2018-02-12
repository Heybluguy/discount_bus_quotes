require 'rails_helper'

describe 'as a user' do
  describe 'when i am logged in' do
    scenario 'i can log out when i click on a logout button' do
      user = User.create!(name: "Peter Parker", email: "Webhead@yahoo.com", password: "uncle Ben")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on "Logout"

      expect(current_path).to eq('/')
      expect(page).to have_content("Sign Up to Be a User")
      expect(page).to have_content("I already have an account")
    end
  end
end