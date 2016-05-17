class Place < ActiveRecord::Base
  belongs_to :country
  has_many :birdimages
  has_many :observations
  validates_presence_of :country
  validates_presence_of :municipal
  validates_presence_of :obsplace
end
