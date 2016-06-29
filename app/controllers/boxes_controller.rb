class BoxesController < ApplicationController
  before_action :set_plan
  before_action :set_box, except: [:index, :new, :create]
  before_action :require_admin, except: [:index, :show]
  
  def index
    @boxes = @plan.boxes
  end

  def new
    @box = Box.new
  end

  def create
    if @plan.boxes.create(box_params)
      redirect_to plan_boxes_path(@plan), notice: 'successfully created '
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:month, :plan_id)
  end
end
