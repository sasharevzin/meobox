class Api::V1::PlanSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :active, :user_id
end