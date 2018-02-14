require 'rails_helper'
describe 'as a logged in user' do
  describe 'when im am in my own company path' do
    scenario 'i see all info for my company as well as option to edit or delete it' do
      state = create(:state)
      user = create(:user)
      company = create(:company, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_company_path(user, company)

      expect(current_path).to eq(user_company_path(user, company))
      expect(page).to have_content(company.name)
      expect(page).to have_content(company.phone)
      expect(page).to have_content(company.email)
      expect(page).to have_content(company.website)
      expect(page).to have_content(company.description)
    end
  end
end