class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :size, :url, :price, :edit_url
  # ,:custom_data

  # def attributes
  #   data = super
  #   data[:edit_url] = edit_item_url(object) 
  #   data,
  # end

# define custome method for the object
  def edit_url
    edit_item_url(object)
  end

  # def custom_data
  #   "my custom data"
  # end
end
