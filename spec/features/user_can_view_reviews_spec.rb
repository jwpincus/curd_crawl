require 'rails_helper'

describe "restaurant reviews" do
  scenario "seen on restaurant show page" do
    n = Neighborhood.create(name: "Denver")
    restaurant = Restaurant.create(name: "X",
                                   address: "1 A Ave",
                                   phone: "123-456-7890",
                                   neighborhood_id: n.id)
    review_1 = restaurant.reviews.create(name: "Beth",
                                         review: "It was fine.",
                                         rating: 5)
    review_2 = restaurant.reviews.create(name: "Andrew",
                                         review: "Had better.",
                                         rating: 3)

    visit restaurant_path(restaurant)

    within("div.reviews div:nth-child(1)") do
      expect(page).to have_content("Name: Andrew")
      expect(page).to have_content("Review: Had better.")
      expect(page).to have_content("Rating: 3")
    end

    within("div.reviews div:nth-child(2)") do
      expect(page).to have_content("Name: Beth")
      expect(page).to have_content("Review: It was fine.")
      expect(page).to have_content("Rating: 5")
    end
  end
end
