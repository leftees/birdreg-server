class BirdSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :birdcat
  
  def name
    birdnames = object.birdnames
    langs = birdnames.map(&:lang).map(&:name)
    names = birdnames.map(&:name)
    Hash[langs.zip(names)]
  end
end
