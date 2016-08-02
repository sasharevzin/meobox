class Api::V1::ItemsController < ApplicationController
  def index
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @item, root: false }
    end
  end

  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @item, root: false }
    end
  end
end