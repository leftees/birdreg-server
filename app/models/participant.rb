class Participant < ActiveRecord::Base
  belongs_to :person
  belongs_to :observation
  validates_presence_of :person
  validates_presence_of :observation
end
