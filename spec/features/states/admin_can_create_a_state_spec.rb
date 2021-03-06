require 'rails_helper'

describe 'as an user' do
  describe 'when i am on the index path as an admin' do
    scenario 'i see a "add a state" that takes me to a form to create a state' do
      admin = create(:user, role: 1)
      state = create(:state)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_states_path(admin)

      click_on "Add a State"

      expect(current_path).to eq(new_admin_state_path)

      fill_in "state[name]",	with: "Wakanda"

      click_on "Create State"

      expect(page).to have_content("Wakanda")
    end
  end

  describe 'when i attempt to go to the new admin state path as an default user' do
    scenario 'i see a 404' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/states"
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end