class Birdname < ActiveRecord::Base
  belongs_to :lang
  belongs_to :bird
  validates_presence_of :lang
  validates_presence_of :name
  validates_presence_of :bird
end
