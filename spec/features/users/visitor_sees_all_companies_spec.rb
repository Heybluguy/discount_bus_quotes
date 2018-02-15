require 'rails_helper'

describe 'as a user visiting the welcome page' do
  describe 'when i am not logged in' do
    scenario 'I see all of the companies with their info' do
      state = create(:state)
      user = create(:user)
      company = create(:company, user: user)
      visit '/'

      expect(page).to have_content("firstclass transportation")
    end
  end
end