# require "spec_helper"
#
# feature "location", vcr: true do
#
#   # As a user
#   # I want to see my current location
#   # So I know where I'm at on the planet.
#
#   # Acceptance Criteria
#   # [x] User's city is displayed
#   # [x] User's state is displayed
#   # [x] User's country is displayed
#
#   scenario "user sees their current location" do
#     binding.pry
#     visit "/"
#     # save_and_open_page
#     expect(page).to have_content("Boston")
#     expect(page).to have_content("Massachusetts")
#     expect(page).to have_content("United States")
#   end
# end
