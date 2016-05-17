class Birdimage < ActiveRecord::Base
  belongs_to :bird
  belongs_to :place
  belongs_to :person
  validates_presence_of :image
  validates_presence_of :person
end
