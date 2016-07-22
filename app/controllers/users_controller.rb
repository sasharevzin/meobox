class UsersController < ApplicationController
  
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :set_plan, only: [:show, :history]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up!"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated!"
      # redirect_to "/users/#{@user.id}"
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end

  def history
    if current_user.admin?
      @shipped_boxes = Box.where(shipped: true)
    else
      @shipped_boxes = @plan.boxes.where(shipped: true) if @plan
    end    
  end

  private

  def set_plan    
    @plan = current_user.plan
  end

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url puts "PARAMS: #{params.inspect}"
    item_attrs = params[:box][:item_attribuets].values.map { |attr| attr }   
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
