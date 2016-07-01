class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_box, except: [:new, :index, :show]  
  before_action :require_admin, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def create
    if @box.items.create(item_params)
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


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_box
    puts "params: #{params.inspect}"
    puts "params: #{params[:item].inspect}"
    @box = Box.find(params[:item][:box_id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :size, :url, :box_id)
  end
end
