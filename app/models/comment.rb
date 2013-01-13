class Comment < ActiveRecord::Base
  attr_accessible :body
  
  has_one :content, :as => :contentable
end
