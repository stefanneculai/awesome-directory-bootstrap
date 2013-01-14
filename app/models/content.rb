class Content < ActiveRecord::Base
  has_many :likes, :dependent => :destroy
  has_many :hits, :dependent => :destroy
  has_many :tags
  has_many :ratings
  has_many :attachments, :dependent => :destroy
  has_many :parent_mappings, :class_name => "Mapping", :foreign_key => "child_id", :dependent => :destroy
  has_many :child_mappings, :class_name => "Mapping", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :user
  belongs_to :contentable, :polymorphic => true
  
  attr_accessible :contentable, :user

  def has_rated(user)
    rating = Rating.where(:content_id => self.id, :user_id => user.id)

    return rating.any?
  end

  def rating
    ratings = self.ratings

    if ratings.length
      return (ratings.collect(&:rate).sum.to_f / ratings.length).round(2)
    else
      return 0
    end
  end
end
