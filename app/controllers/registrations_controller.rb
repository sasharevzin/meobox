class RegistrationsController < ApplicationController
  
  def create    
    @plan = Plan.find_by_name(params[:plan_name])
    @user = User.find(params[:user_id])
    # attach the plan to the user
    if @user.already_registered_for?(@plan)
      flash[:notice] = "You are already subscribed to #{@plan.name}!"
    else
      flash[:notice] = "Successfully subscribed to #{@plan.name}!"
      Registration.create(user_id: @user.id, plan_id: @plan.id)      
    end        
    redirect_to @plan
  end

  def destroy
    @plan = Plan.find_by_name(params[:plan_name])
    @user = User.find(params[:user_id])
    Registration.where(user_id: @user.id, plan_id: @plan.id).destroy
    flash[:notice] = "You are  unsubscribed to #{@plan.name}!"
    redirect_to :root
  end
end
