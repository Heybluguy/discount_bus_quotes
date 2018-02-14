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

    scenario "i should not see another user's companies" do
      state = State.create!(name: "Florida")
      user = create(:user, name: "Thor")
      user_2 = create(:user, name: "Scarlett Witch", email: "twinsies@mail.com")
      company = create(:company, name: "Hammer Co.", user: user)
      company_2 = create(:company, name: "Palm Readings", user: user_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit user_companies_path(user)

      expect(page).to_not have_content("Hammer Co.")
      expect(page).to have_content("Palm Readings")
    end
  end
end