require 'rails_helper'

describe 'as a user' do
  describe 'when i am logged in' do
    scenario 'i can log out when i click on a logout button' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on "Logout"

      expect(current_path).to eq('/')
    end
  end
end