require 'rails_helper'

describe 'as an user' do
  describe 'when i am on the index path as an admin' do
    scenario 'i see a delete link for each state to do delete' do
      admin = create(:user, role: 1)
      state = create(:state)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_states_path(admin)

      click_on "Delete"

      expect(page).to_not have_content("Florida")
    end
  end

  describe 'when i am on the index path as a default user' do
    scenario 'i see a 404' do
      user = create(:user)
      state = create(:state)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/states"
      expect(page).to_not have_content("Florida")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

end