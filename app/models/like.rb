class Like < ActiveRecord::Base
  belongs_to :content
  belongs_to :user
end
