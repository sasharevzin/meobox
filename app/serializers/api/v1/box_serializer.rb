class Api::V1::BoxSerializer < ActiveModel::Serializer
  attributes :subscription, :title, :theme_title, :shipped

  has_many :items, serializer: Api::V1::ItemSerializer
end