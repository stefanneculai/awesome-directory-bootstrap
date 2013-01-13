class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :parent_id
      t.integer :child_id
      
      t.timestamps
    end
    
    add_index :mappings, :parent_id
    add_index :mappings, :child_id
  end
end
