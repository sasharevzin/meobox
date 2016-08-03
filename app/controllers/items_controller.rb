class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_box, except: [:index, :destroy]  
  before_action :set_plan, except: [:index, :show] 
  before_action :require_admin, except: [:index, :show]
  
  def index
    @items = Item.search(params[:search]).page params[:page]
  end

  def create
    @item = @box.items.new(item_params)
    
    if @item.save
      render json: { item: @item }, status: 201 
      # redirect_to items_path, notice: 'successfully created'
    else
      render 'new'
    end
  end

  def new
    @item = Item.new
  end

  def show
   
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'successfully deleted '
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

   def set_plan    
    # http://localhost:3000/plans/1/boxes/1/items
    @plan = if params[:plan_id].present?    
      Plan.find(params[:plan_id])  
    # non-nested route http://localhost:3000/items/new
    elsif @box
      @box.plan
    end
  end

  def set_box
    # http://localhost:3000/plans/1/boxes/1/items
    @box = if params[:box_id].present?    
      Box.find(params[:box_id]) 
    # http://localhost:3000/items/new
    elsif params[:item] && params[:item][:box_id]
      Box.find(params[:item][:box_id])
    end    
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :size, :url, :box_id)
  end
end
