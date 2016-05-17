class Person < ActiveRecord::Base
  has_many :birdimages
  has_many :participants
  has_many :observations, :through => :participants
  validates_presence_of :name
end
