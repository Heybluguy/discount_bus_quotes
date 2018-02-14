require 'rails_helper'

describe 'User visits states index page' do
  describe 'as admin' do
    scenario 'allows admin to see all states' do
      state = create(:state)
      admin = User.create(email: "Ironman@mail.com",
                          password: "boom",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_states_path
      expect(page).to have_content("Admin States")
    end
  end

  describe "as a default user" do
    scenario 'does not allow default user to see admin states index' do
      user = User.create(email: "BlackPanther@mail.com", password: "meow", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_states_path
      expect(page).to_not have_content("Admin States")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

end