class ChangeCrawls < ActiveRecord::Migration[5.0]
  def change
    change_column :crawls, :approved, :boolean, default: false
  end
end
