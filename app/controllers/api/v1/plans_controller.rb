class Api::V1::PlansController < ApplicationController
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
end