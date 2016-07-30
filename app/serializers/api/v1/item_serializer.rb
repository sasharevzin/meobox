class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :description, :title, :size, :url, :price
end
