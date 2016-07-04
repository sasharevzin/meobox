class PagesController < ApplicationController
  before_action :set_auth

  def home
    @plan_1 = Plan.find_by_name("Basic Membership")
    @plan_2 = Plan.find_by_name("Silver Membership")
    @plan_3 = Plan.find_by_name("Gold Membership")
  end

  def about 

  end

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
