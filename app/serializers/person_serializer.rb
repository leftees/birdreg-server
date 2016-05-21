class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :info, :visible
end
