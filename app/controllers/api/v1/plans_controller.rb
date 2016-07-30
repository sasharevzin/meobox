class Api::V1::PlansController < ApplicationController
  def index
    @plans = Plan.all
    render(
      status: :ok,
      json: @plans,
      each_serializer: Api::V1::PlanSerializer
    )
  end
end