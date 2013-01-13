class Mapping < ActiveRecord::Base
  belongs_to :parent, :class_name => "Content", :foreign_key => "parent_id"
  belongs_to :child, :class_name => "Content", :foreign_key => "child_id"
  
  attr_accessible :parent, :child
end
