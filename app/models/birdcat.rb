class Birdcat < ActiveRecord::Base
  belongs_to :parent, :foreign_key => :birdcat_id, :class_name => "Birdcat"
  has_many :birdcats
  has_many :birdcatnames
  has_many :birds

  def name(lang: nil)
    if !lang
      return names_hash
    end
    bcn = Birdcatname.find_name_by_lang(birdcat_id: self.id, lang: lang)
    return nil if !bcn
    bcn.name
  end

  def names_hash
    langs = birdcatnames.map(&:lang).map(&:name)
    names = birdcatnames.map(&:name)
    Hash[langs.zip(names)]
  end
end
