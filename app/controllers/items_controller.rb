class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_box
  before_action :set_plan
  
  def index
    @items = @box.items    
  end

  def create
    if @box.items.create(item_params)
      redirect_to plan_box_items_path(@plan, @box), notice: 'successfully created '
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


  private

  def set_item
    @item = Item.find(params[:id])
  end

   def set_box
    @box = Box.find(params[:box_id])
  end

   def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def item_params
    params.require(:item).permit(:title, :desciption, :price, :image, :size, :url)
  end
end
