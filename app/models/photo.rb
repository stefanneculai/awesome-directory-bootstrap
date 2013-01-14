class Photo < ActiveRecord::Base
  has_one :attachement, :as => :attachable, :dependent => :destroy
end
