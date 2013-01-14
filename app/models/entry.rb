class Entry < ActiveRecord::Base
  attr_accessible :body, :title, :rating
  
  has_one :content, :as => :contentable, :dependent => :destroy
  
  after_update do
    self.content.touch
  end
end
