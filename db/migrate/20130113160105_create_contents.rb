class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :contentable, :polymorphic => true
      t.references :user
      t.timestamps
    end
    
    add_index :contents, :user_id
  end
end
