require 'rails_helper'

feature "Homepage" do
  scenario "As a user I can visit the homepage and see site name and tag line" do
    visit '/'

    expect(page).to have_content("Cageflix")
    expect(page).to have_content("Netflix for Nic Cage movies")
  end

  scenario "Movies should appear ordered by their year" do
    visit "/"
    click_link("Add Movie")

    fill_in "movie[name]", with: "Some Movie"
    fill_in "movie[year]", with: "1997"
    fill_in "movie[synopsis]", with: "Nick Cage acts crazy"
    click_button "Create Movie"

    click_link("Add Movie")

    fill_in "movie[name]", with: "Another Movie"
    fill_in "movie[year]", with: "2001"
    fill_in "movie[synopsis]", with: "Nick Cage acts even crazier"
    click_button "Create Movie"

    click_link("Add Movie")

    fill_in "movie[name]", with: "Yet Another Movie"
    fill_in "movie[year]", with: "1999"
    fill_in "movie[synopsis]", with: "Nick Cage acts even nuttier"
    click_button "Create Movie"

    within('#0') do
      expect(page).to have_content("2001")
    end

    within('#1') do
      expect(page).to have_content("1999")
    end

    within('#2') do
      expect(page).to have_content("1997")
    end

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

  scenario "New movie form validates for name/year presence and year is a number. Shows error messages on form" do
    visit '/'
    click_link("Add Movie")
    click_button("Create Movie")

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Year can't be blank")
    expect(page).to have_content("Year is not a number")
  end
end

