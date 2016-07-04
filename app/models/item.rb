class Item < ActiveRecord::Base
  belongs_to :box
  validates :title, :description, :price, presence: true
end
