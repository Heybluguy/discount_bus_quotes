require 'rails_helper'

describe 'as a user' do
  describe 'when im on my company index' do
    scenario 'i can delete a company' do
      state = create(:state)
      user = create(:user)
      company = create(:company, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_companies_path(user)

      click_on "Delete"

      expect(page).to_not have_content("firstclasstranssportation.com")
    end
  end
end