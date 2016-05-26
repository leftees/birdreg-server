class Bird < ActiveRecord::Base
  belongs_to :birdcat
  has_many :birdnames
  has_many :birdimages
  has_many :observation_items
  has_many :observations, :through => :observation_items
  validates_presence_of :birdcat

  # Twin method, used for both single name for requested language,
  # or hash of all names if no language is specified
  def name(lang: nil)
    Lang.name_from_resource_names(resource_names: birdnames, lang: lang)
  end
end
