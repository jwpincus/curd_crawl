class CreateCrawls < ActiveRecord::Migration[5.0]
  def change
    create_table :crawls do |t|
      t.datetime :time
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end
