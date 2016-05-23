class Birdcat < ActiveRecord::Base
  belongs_to :parent, :foreign_key => :birdcat_id, :class_name => "Birdcat"
  has_many :birdcats
  has_many :birdcatnames
  has_many :birds

  def name(lang: nil)
    Lang.name_from_resource_names(resource_names: birdcatnames, lang: lang)
  end
end
