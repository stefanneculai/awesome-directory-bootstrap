class Directory < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_one :content, :as => :contentable, :dependent => :destroy
  
  after_update do
    self.content.touch
  end

  def rating
    return (ActiveRecord::Base.connection.select_value("select directory_rating(#{self.id})")).to_f.round(2)
  end
end
