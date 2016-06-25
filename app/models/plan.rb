class Plan < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations

  validates_presence_of :name, :description, :price
end