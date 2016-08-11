class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :size, :url, :price, :edit_url, :formatted_price
  # define custom method for the object
  def edit_url
    edit_item_url(object)
  end

  def formatted_price
    ActiveSupport::NumberHelper.number_to_currency(object.price) || '$100.00'
  end

end
