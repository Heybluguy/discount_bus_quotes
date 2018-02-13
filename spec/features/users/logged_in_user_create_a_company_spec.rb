require 'rails_helper'

describe 'as a logged in user' do
  describe 'when i am on the new company path' do
    scenario 'i see a form for creating a new company' do
      user = create(:user)

      visit new_user_company_path(user)

      fill_in "company[name]",	with: "firstclass transportation"
      fill_in "company[phone]",	with: "904-964-504"
      fill_in "company[email]",	with: "fct@mail.com"
      fill_in "company[website]",	with: "firstclasstransportation.com"
      fill_in "company[description]",	with: "transportation for all"
      attach_file('company[image]', "./spec/data/image.jpeg")

      click_on "Create Company"

      expect(page).to have_content("firstclass transportation")
    end
  end
end