class Bird < ActiveRecord::Base
  belongs_to :birdcat
  has_many :birdnames
  has_many :birdimages
  has_many :observation_items
  has_many :observations, :through => :observation_items
  validates_presence_of :birdcat
  validates_presence_of :birdnames
end
