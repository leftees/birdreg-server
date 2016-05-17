class Birdcatname < ActiveRecord::Base
  belongs_to :lang
  belongs_to :birdcat
  validates_presence_of :lang
  validates_presence_of :name
end
