class RegistrationsController < ApplicationController
  
  def create    
    @plan = Plan.find_by_name(params[:plan_name])
    @user = User.find(params[:user_id])
    # attach the plan to the user
    if @user.already_registered_for_any_plan?
      flash[:notice] = "You are already subscribed to #{current_user.plan.name}! You have to unsubscribe that plan in order to subscribe a new plan"
    else
      flash[:notice] = "Successfully subscribed to #{@plan.name}!"
      Registration.create(user_id: @user.id, plan_id: @plan.id, expired_at: DateTime.now + 1.month)      
    end        
    redirect_to @plan
  end

  def unsubscribe
    @plan = Plan.find_by_name(params[:plan_name])
    @user = User.find(params[:user_id])
    # flash[:notice] = "You are  unsubscribed to #{@plan.name}!"
    Registration.where(user_id: @user.id, plan_id: @plan.id).destroy_all
    redirect_to :root
  end
end
