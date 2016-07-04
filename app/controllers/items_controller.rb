class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_box, except: [:new, :index, :show, :destroy]  
  before_action :set_plan, except: [:new, :index, :show] 
  before_action :require_admin, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def create
    @item = @box.items.new(item_params)
    if @item.save
      redirect_to items_path, notice: 'successfully created '
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
    if params[:plan_id].present?    
      @plan = Plan.find(params[:plan_id])    
    elsif @box
      @plan = @box.plan
    end
  end

  def set_box
    @box = Box.find(params[:item][:box_id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :size, :url, :box_id)
  end
end
