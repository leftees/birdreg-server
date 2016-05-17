class ObservationItem < ActiveRecord::Base
  belongs_to :observation
  belongs_to :bird
  validates_presence_of :observation
  validates_presence_of :bird
  validates_presence_of :count
  validates_numericality_of :count, only_integer: true, greater_than: 0
end
