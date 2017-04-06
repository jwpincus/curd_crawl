require 'rails_helper'

describe "restaurant reviews," do
  scenario "user can add a review" do
    n = Neighborhood.create(name: "Denver")
    restaurant = Restaurant.create(name: "X",
                                   address: "1 A Ave",
                                   phone: "123-456-7890",
                                   neighborhood_id: n.id)
    visit restaurant_path(restaurant)
    fill_in "Name", with: "Jack"
    fill_in "Review", with: "Super squeeky"
    fill_in "Rating", with: 5
  end
end
