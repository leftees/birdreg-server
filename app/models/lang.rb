class Lang < ActiveRecord::Base
  has_many :birdnames
  has_many :birdcatnames
  validates_presence_of :name

  def self.find_ids_by_name(lang_name)
    Lang.where(name: lang_name).select(:id)
  end
end
