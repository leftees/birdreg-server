class Lang < ActiveRecord::Base
  has_many :birdnames
  has_many :birdcatnames
  validates_presence_of :name

  def self.find_ids_by_name(lang_name)
    Lang.where(name: lang_name).select(:id)
  end
  
  def self.name_from_resource_names(resource_names:, lang: nil)
    if !lang
      return names_hash(resource_names)
    end
    lang_name = resource_names.where(lang_id: Lang.find_ids_by_name(lang)).first
    return nil if !lang_name
    lang_name.name
  end
    
  def self.names_hash(resource_names)
    langs = resource_names.map(&:lang).map(&:name)
    names = resource_names.map(&:name)
    Hash[langs.zip(names)]
  end
end
