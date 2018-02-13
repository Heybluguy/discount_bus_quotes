require 'rails_helper'

describe 'as a user' do
  describe 'when i am on on the edit company path' do
    scenario 'i see an edit form to change the information for a company' do
      state = State.create!(name: "Florida")
      user = create(:user)
      company = create(:company, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_company_path(user, company)

      fill_in "company[name]",	with: "eastcoast transportation"
      fill_in "company[phone]",	with: "904-555-504"
      fill_in "company[email]",	with: "ect@mail.com"
      fill_in "company[website]",	with: "eastcoasttransportation.com"
      fill_in "company[description]",	with: "We can take you anywhere."
      select("Florida", :from => "company[states]")
      attach_file('company[image]', "./spec/data/image.jpeg")

      click_on "Update Company"

      expect(page).to have_content("eastcoast transportation")
      expect(page).to have_content("904-555-504")
      expect(page).to have_content("ect@mail.com")
      expect(page).to have_content("eastcoasttransportation.com")
      expect(page).to have_content("We can take you anywhere.")
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