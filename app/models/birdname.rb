class Birdname < ActiveRecord::Base
  belongs_to :lang
  belongs_to :bird
  validates_presence_of :lang
  validates_presence_of :name
  validates_presence_of :bird

  def self.find_name_by_lang(bird_id:, lang:)
    Birdname.where(lang_id: Lang.find_id_by_name(lang)).where(bird_id: bird_id).first
  end
end
