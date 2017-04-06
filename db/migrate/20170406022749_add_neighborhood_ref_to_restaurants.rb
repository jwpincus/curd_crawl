class AddNeighborhoodRefToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_reference :restaurants, :neighborhood, foreign_key: true
  end
end
