class Directory < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_one :content, :as => :contentable
end
