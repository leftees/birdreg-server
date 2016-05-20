class Bird < ActiveRecord::Base
  belongs_to :birdcat
  has_many :birdnames
  has_many :birdimages
  has_many :observation_items
  has_many :observations, :through => :observation_items
  validates_presence_of :birdcat

  def name(lang:)
    bn = Birdname.find_name_by_lang(bird_id: self.id, lang: lang)
    return nil if !bn
    bn.name
  end
end
