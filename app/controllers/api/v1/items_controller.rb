class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items, root: false 
  end

  def show
    item = Item.find(params[:id])
    render(
      json: item, 
      root: false,
      serializer: Api::V1::ItemSerializer
    )
  end
end