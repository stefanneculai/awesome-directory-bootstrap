class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.references :content
      t.timestamps
    end
    
    add_index :hits, :content_id
  end
end
