class StatusToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :status, :string
  end
end
