class PagesController < ApplicationController
 
  def home
    @plan_1 = Plan.find_by_name("Basic Membership")
    @plan_2 = Plan.find_by_name("Silver Membership")
    @plan_3 = Plan.find_by_name("Gold Membership")
  end

  def about 

  end
 
end
