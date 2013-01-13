class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :content
      t.references :user

      t.timestamps
    end
    add_index :likes, :content_id
    add_index :likes, :user_id
  end
end
