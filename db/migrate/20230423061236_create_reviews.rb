class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :comments
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
    add_index :reviews, [:reviewable_type, :reviewable_id]
  end
end
