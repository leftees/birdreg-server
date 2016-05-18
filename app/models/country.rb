class Country < ActiveRecord::Base
  has_many :places
  has_many :observations, :through => :places
  validates_presence_of :name
end
