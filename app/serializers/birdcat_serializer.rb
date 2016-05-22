class BirdcatSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :parent, unless: 'object.parent.blank?'

  def name
    birdcatnames = object.birdcatnames
    langs = birdcatnames.map(&:lang).map(&:name)
    names = birdcatnames.map(&:name)
    Hash[langs.zip(names)]
  end
end

class TopBirdcatSerializer < BirdcatSerializer
  has_many :birdcats
end

