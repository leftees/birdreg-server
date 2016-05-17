class Birdcat < ActiveRecord::Base
  belongs_to :parent, :foreign_key => :birdcat_id, :class_name => "Birdcat"
  has_many :birdcats
  has_many :birdcatnames
  has_many :birds
  validates_presence_of :birdcatnames
end
