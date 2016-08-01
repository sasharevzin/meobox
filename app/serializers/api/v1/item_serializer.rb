class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :size, :url, :price

  def attributes
    data = super
    data[:edit_url] = edit_item_url(object) 
    data
  end
end
