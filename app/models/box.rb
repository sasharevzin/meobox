class Box < ActiveRecord::Base
  has_many :items
  belongs_to :plan
end
