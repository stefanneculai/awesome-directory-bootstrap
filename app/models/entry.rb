class Entry < ActiveRecord::Base
  attr_accessible :body, :title
  
  has_one :content, :as => :contentable
end
