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
    fill_in "review[review]", with: "Super squeeky"
    select 5, from: "review[rating]"
  end
end
