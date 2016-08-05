class Api::V1::UsersController < ApplicationController
  # skip to make sure the request came from the correct user and it is safe
  skip_before_filter :verify_authenticity_token

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def new
    user = User.new
  end

  def create
    user = User.new user_params
    user.save
    render json: { user: user }, status: 201 

  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end