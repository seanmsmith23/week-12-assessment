require 'rails_helper'

feature "Homepage" do
  scenario "As a user I can visit the homepage and see site name and tag line" do
    visit '/'

    expect(page).to have_content("Cageflix")
    expect(page).to have_content("Netflix for Nic Cage movies")
  end
end