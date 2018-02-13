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
      select("Florida", :from => "company[states]")
      attach_file('company[image]', "./spec/data/image.jpeg")
      click_on "Create Company"

      expect(current_path).to eq(user_companies_path(user))
      expect(page).to have_content("firstclass transportation")
      expect(page).to have_content("904-964-504")
      expect(page).to have_content("fct@mail.com")
      expect(page).to have_content("firstclasstransportation.com")
      expect(page).to have_content("transportation for all")
    end
  end
end