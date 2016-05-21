class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :municipal, :obsplace, :info, :obsgroup, :country
  
  def country
    object.country.name
  end
end
