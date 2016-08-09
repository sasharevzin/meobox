class Api::V1::ItemsController < ApplicationController   
  
  def index
    items = Item.search(params[:search])
    render json: items, root: false, each_serializer: Api::V1::ItemSerializer
  end

  def show
    item = Item.find(params[:id])
    render(
      json: item, 
      root: false,
      serializer: Api::V1::ItemSerializer
    )
  end

  def create    
    item = Item.new(item_params)
    
    if item.save
      render json: { item: item }, status: 201 
    else
      errors = item.errors.full_messages
      render json: {errors: errors}, status: 400
    end
   end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :size, :url, :box_id)
  end
end