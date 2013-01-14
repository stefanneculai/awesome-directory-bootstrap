class Category < ActiveRecord::Base
  attr_accessible :name
  
  has_one :content, :as => :contentable, :dependent => :destroy
  
  after_update do
    self.content.touch
  end
end
