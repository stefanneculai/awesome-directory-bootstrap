class Entry < ActiveRecord::Base
  attr_accessible :body, :title
  
  has_one :content, :as => :contentable
  
  after_update do
    self.content.touch
  end
end
