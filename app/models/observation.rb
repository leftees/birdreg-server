class Observation < ActiveRecord::Base
  belongs_to :place
  has_many :participants
  has_many :people, :through => :participants
  has_many :observation_items
  has_many :birds, :through => :observation_items
  validates_presence_of :stamp
  validates_presence_of :estamp
  validates_presence_of :place
end
