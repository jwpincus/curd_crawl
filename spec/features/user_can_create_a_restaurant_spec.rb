require 'rails_helper'

describe "User adds a restaurant" do
  scenario "user creates a new restaurant and sees it on show" do
    Neighborhood.create(name:"Denver")
    visit new_restaurant_path
    fill_in "Name", with: "Lucky Pie"
    fill_in "Address", with: "1200 16th st, Denver CO"
    fill_in "Phone", with: "303-887-7673"
    click_on "Seize the Cheese!"
    expect(page).to have_content("Lucky Pie")
    expect(page).to have_content("1200 16th st, Denver CO")
    expect(page).to have_content("303-887-7673")
  end
end
