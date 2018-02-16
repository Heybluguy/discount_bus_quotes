require 'rails_helper'

describe 'as a user' do
  describe 'when i am on on the edit company path' do
    scenario 'i see an edit form to change the information for a company' do
      state = create(:state)
      user = create(:user)
      company = create(:company, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_company_path(user, company)

      fill_in "company[name]",	with: "eastcoast transportation"
      fill_in "company[phone]",	with: "904-555-504"
      fill_in "company[email]",	with: "ect@mail.com"
      fill_in "company[website]",	with: "eastcoasttransportation.com"
      fill_in "company[description]",	with: "We can take you anywhere."
      within(first('.state-collection')) do
        select("Florida", :from => "company[state_ids][]")
      end

      click_on "Update Company"

      expect(page).to have_content("eastcoast transportation")
      expect(page).to have_content("904-555-504")
      expect(page).to have_content("ect@mail.com")
      expect(page).to have_content("eastcoasttransportation.com")
      expect(page).to have_content("We can take you anywhere.")
    end
  end
end