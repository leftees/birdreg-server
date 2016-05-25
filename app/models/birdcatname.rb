class Birdcatname < ActiveRecord::Base
  belongs_to :lang
  belongs_to :birdcat
  validates_presence_of :lang
  validates_presence_of :name
  validates_presence_of :birdcat

  def self.find_name_by_lang(birdcat_id:, lang:)
    Birdcatname.where(lang_id: Lang.find_ids_by_name(lang)).where(birdcat_id: birdcat_id).first
  end
end
