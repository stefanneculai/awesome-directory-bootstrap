class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.references :user
      t.references :content

      t.timestamps
    end
    add_index :ratings, :user_id
    add_index :ratings, :content_id
  end
end
