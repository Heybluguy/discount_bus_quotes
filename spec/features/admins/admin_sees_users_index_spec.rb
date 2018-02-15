require 'rails_helper'

describe 'User visits user index page' do
  describe 'as admin' do
    scenario 'allows admin to see all users' do
      state = create(:state)
      admin = User.create(email: "Ironman@mail.com",
                          password: "boom",
                          role: 1)
      user = create(:user)
      user = create(:user, email: "venom@mail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      expect(page).to have_content("Peter Parker")
      expect(page).to have_content("venom@mail.com")
    end
  end
end