require 'rails_helper'

describe 'as a logged in user' do
  describe 'when i am on the new company path' do
    scenario 'i see a form for creating a new company' do
      state = State.create!(name: "Florida")
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_company_path(user)

      fill_in "company[name]",	with: "firstclass transportation"
      fill_in "company[phone]",	with: "904-964-504"
      fill_in "company[email]",	with: "fct@mail.com"
      fill_in "company[website]",	with: "firstclasstransportation.com"
      fill_in "company[description]",	with: "transportation for all"
      within(first('.state-collection')) do
        select("Florida", :from => "company[state_ids][]")
      end
      within(first('.image-collection')) do
        attach_file('company[images][]', "./spec/data/image.jpeg")
      end

      click_on "Create Company"

      expect(current_path).to eq(user_companies_path(user))
      expect(page).to have_content("firstclass transportation")
      expect(page).to have_content("904-964-504")
      expect(page).to have_content("fct@mail.com")
      expect(page).to have_content("firstclasstransportation.com")
      expect(page).to have_content("transportation for all")
    end
  end

  describe 'when i attempt to go to new user company path that is not mine' do
    scenario 'i see my own new company path' do
      state = State.create!(name: "Florida")
      user_1 = create(:user, name: "Thor")
      user_2 = create(:user, name: "Scarlett Witch", email: "twinsies@mail.com")
      company = create(:company, name: "Hammer Co.", user: user_1)
      company_2 = create(:company, name: "Palm Readings", user: user_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit new_user_company_path(user_1)

      expect(page).to have_content("New Company for Scarlett Witch")
    end
  end
end