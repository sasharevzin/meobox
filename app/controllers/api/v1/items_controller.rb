class Api::V1::ItemsController < ApplicationController   
  
  def index
    items = Item.search(params[:search])
    a = Api::V1::ItemSerializer.new(items)
    render json: items, each_serializer: ItemSerializer
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
      # redirect_to items_path, notice: 'successfully created'
    else
      render 'new'
    end
   end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :size, :url, :box_id)
  end
end