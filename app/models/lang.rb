class Lang < ActiveRecord::Base
  has_many :birdnames
  has_many :birdcatnames
  validates_presence_of :name

  def self.find_id_by_name(lang_name)
    Lang.find_by_name(lang_name).id
  end
end
