class Attachment < ActiveRecord::Base
  belongs_to :content
  
  belongs_to :attachable, :polymorphic => true
end
