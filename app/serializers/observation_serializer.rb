class ObservationSerializer < ActiveModel::Serializer
  attributes :id, :stamp, :estamp, :info
  
  belongs_to :place
  has_many :observation_items
  has_many :people, :through => :participants
end
