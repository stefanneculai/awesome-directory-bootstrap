class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :content
  attr_accessible :rate, :user, :content
end
