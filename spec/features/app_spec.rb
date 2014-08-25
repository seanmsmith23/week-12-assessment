require 'rails_helper'

feature "Homepage" do
  scenario "As a user I can visit the homepage and see site name and tag line" do
    visit '/'

    expect(page).to have_content("Cageflix")
    expect(page).to have_content("Netflix for Nic Cage movies")
  end
end

feature "Add Movies" do
  scenario "As a user when I click Add Movie I see a form to create a movie" do
    visit '/'

    expect(page).to have_link("Add Movie")

    click_link("Add Movie")

    expect(page).to have_content("Name")
    expect(page).to have_content("Year")
    expect(page).to have_content("Synopsis")
    expect(page).to have_button("Create Movie")
  end
end