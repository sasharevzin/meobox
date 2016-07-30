class Api::V1::PlansController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    plans = Plan.all
    render(
      root: false,
      status: :ok,
      json: plans,
      each_serializer: Api::V1::PlanSerializer
    )
  end

  def show
    plan = Plan.find(params[:id])
    render(
      root: false,
      status: :ok,
      json: plan,
      serializer: Api::V1::PlanSerializer
    )
  end

  def create
    plan = Plan.create(plan_params)
    render(
      root: false,
      status: :ok,
      json: plan,
      serializer: Api::V1::PlanSerializer
    )
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    render json: {
      message: "Successfully deleted the plan"
    }
  end

  private

  def plan_params
    params.permit(:user_id, :name, :price, :description, :active)
  end
end