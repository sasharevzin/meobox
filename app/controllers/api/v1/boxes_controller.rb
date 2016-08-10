class Api::V1::BoxesController < ApplicationController   
  
  def index
    boxes = Box.all   
    # rednering and specifying specific serializer
    render json: boxes, root: false, each_serializer: Api::V1::BoxSerializer
  end

  def show
    box = Box.find(params[:id])
    render(
      json: box, 
      root: false,
      serializer: Api::V1::BoxSerializer
    )
  end

  def create    
    box = Box.new(box_params)
    
    if box.save
      render json: { box: box }, status: 201 
    else
      errors = item.errors.full_messages
      render json: {errors: errors}, status: 400
    end
   end

  private

  def box_params
    params.require(:box).permit(:subscription, :title, :theme_title, :shipped)
  end
end