class Hit < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :content
end
