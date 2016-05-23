class BirdcatSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :parent, unless: 'object.parent.blank?'
end

class TopBirdcatSerializer < BirdcatSerializer
  has_many :birdcats
end

