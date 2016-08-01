class Api::V1::BoxSerializer < ActiveModel::Serializer
  # attributes that want to return as JSON
  attributes :subscription, :title, :theme_title, :shipped

  has_many :items, serializer: Api::V1::ItemSerializer
end