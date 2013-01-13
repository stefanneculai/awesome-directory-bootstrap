class Comment < ActiveRecord::Base
  attr_accessible :body
  
  has_one :content, :as => :contentable
  
  after_update do
    self.content.touch
  end
end
