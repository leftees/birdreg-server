class ObservationItemSerializer < ActiveModel::Serializer
  attributes :id, :count, :info
  belongs_to :bird
end
