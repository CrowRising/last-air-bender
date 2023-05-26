# When I visit ""
# And I Select "Fire Nation" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total numer of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.
# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has

require 'rails_helper'

RSpec.describe 'search_results_page' do
  describe 'when I visit the rooth path I can search for members' do
    it 'displays a select field' do
      visit '/'

      select 'Fire Nation', from: :nation
      click_on 'Search For Members'

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Nation Members: 97")

      within '#members' do
        expect(page).to have_css("member-Afiko ~ #member-Azula")
        expect(page).to have_css("member-Azulon ~ #member--Bujing")
        expect(page).to have_css("member--Chey~ #member-Druk")
      end

      within '#member-Afiko' do
        expect(page).to have_content('Name: Afiko')
        expect(page).to have_content("Allies: Fire Nation")
        expect(page).to have_content("Enemies: Aang")
        expect(page).to have_content("img[src*='https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128']")
        expect(page).to have_content("Affliations: Afiko")
      end
    end
  end
end
