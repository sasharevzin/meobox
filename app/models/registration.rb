class Registration < ActiveRecord::Base

  belongs_to :plan
  belongs_to :user

  validates :plan, :uniqueness => {:scope => :user}
  
end
