class BirdSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :birdcat
end
