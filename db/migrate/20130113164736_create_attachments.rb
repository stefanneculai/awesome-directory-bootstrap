class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :attachable, :polymorphic => true
      t.references :content

      t.timestamps
    end
    add_index :attachments, :content_id
  end
end
