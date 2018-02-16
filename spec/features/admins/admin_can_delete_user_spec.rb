
require 'rails_helper'

describe 'User visits user index page' do
  describe 'as admin' do
    scenario 'i can delete a user' do
      admin = User.create(email: "Ironman@mail.com",
                          password: "boom",
                          role: 1)
      user = create(:user)
      user = create(:user, name: "The Hulk", email: "Smash@mail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      first(:link, "Terminate Account").click

      expect(page).to_not have_content("The Hulk")
    end
  end
end