class Api::V1::UsersController < ApplicationController
  @item = Item.find(params[:id])
  respond_to do |format|
    format.html
    format.json { render json: @item, root: false }
  end
end