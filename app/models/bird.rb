class Bird < ActiveRecord::Base
  belongs_to :birdcat
  has_many :birdnames
  has_many :birdimages
  has_many :observation_items
  has_many :observations, :through => :observation_items
  validates_presence_of :birdcat

  def name(lang: 'sv')
    bn = Birdname.find_name_by_lang(bird_id: self.id, lang: lang)
    bn.name
  end
  
  def as_json(options = {})
    super.merge({
      name_sv: name(lang: 'sv'),
      name_en: name(lang: 'en'),
    })
  end
end
