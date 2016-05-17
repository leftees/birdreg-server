class Lang < ActiveRecord::Base
  has_many :birdnames
  has_many :birdcatnames
  validates_presence_of :name
end
