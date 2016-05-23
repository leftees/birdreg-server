class Bird < ActiveRecord::Base
  belongs_to :birdcat
  has_many :birdnames
  has_many :birdimages
  has_many :observation_items
  has_many :observations, :through => :observation_items
  validates_presence_of :birdcat

  def name(lang: nil)
    if !lang
      return names_hash
    end
    bn = Birdname.find_name_by_lang(bird_id: self.id, lang: lang)
    return nil if !bn
    bn.name
  end
  
  def names_hash
    langs = birdnames.map(&:lang).map(&:name)
    names = birdnames.map(&:name)
    Hash[langs.zip(names)]
  end
end
