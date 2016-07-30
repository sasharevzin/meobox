class Api::V1::PlanSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :active, :user_id

  has_many :boxes, serializer: Api::V1::BoxSerializer
end