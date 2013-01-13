class Content < ActiveRecord::Base
  has_many :likes
  has_many :hits
  has_many :attachments
  has_many :parent_mappings, :class_name => "Mapping", :foreign_key => "child_id"
  has_many :child_mappings, :class_name => "Mapping", :foreign_key => "parent_id" 
  belongs_to :user
  belongs_to :contentable, :polymorphic => true
  
  attr_accessible :contentable, :user
end
