class BoxesController < ApplicationController
  before_action :set_plan 
  before_action :set_box, except: [:index, :new, :create, :ship]
  before_action :require_admin, except: [:index, :show]
  
  # index action to fetch all the boxes from the database. 
  # boxes for admin do not require a plan
  def index
    if @plan
      @boxes = @plan.boxes.search(params[:search]).page params[:page]
    else
      @boxes = Box.search(params[:search]).page params[:page]
    end
  end

  #instantiating box 
  def new  
    @box = Box.new
  end

  def create 
    @box = @plan.boxes.new(box_params)  
    puts "inside create box: #{@box.inspect}" 
    if @box.save            
      # array of items attributes
      # each hash is for one item attributes
      # so i get 3 hash for 3 items
      # so its a array of 3 hashes
      item_attrs = params[:box][:item_attributes].values 
      # using custom attribute writer to create items for the box
      # we are passing array of hash 
      # @box.item_attributes=(item_attrs)
      @box.item_attributes = item_attrs
      redirect_to plan_boxes_path(@plan), notice: 'successfully created '
    else
      render 'new'
    end
  end

  def ship
    @box = Box.find(params[:box_id])
    @box.update_attributes(shipped: true)
    redirect_to @box, notice: 'successfully shipped!'
    # redirect_to "/boxes/#{@box.id}"
  end

  def show
   
  end

  def edit
  end

  def update
    if @box.update_attributes(box_params)
      item_attrs = params[:box][:item_attributes].values 
      @box.update_item_attributes = item_attrs
      redirect_to plan_boxes_path(@plan), notice: 'successfully updated '
    else
      render 'edit'
    end
  end

  def destroy
    @box.destroy
    redirect_to boxes_path, notice: 'successfully destroyed'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_plan    
    if params[:plan_id].present?   
      @plan = Plan.find(params[:plan_id])    
    elsif params[:box].present? && params[:box][:plan_id].present?
      @plan = Plan.find(params[:box][:plan_id])
    end
  end

  def set_box
    # find the box from the database using the id
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:starts_at, :theme_title, :plan_id)
  end
end
