class Photo < ActiveRecord::Base
  has_one :attachement, :as => :attachable
end
