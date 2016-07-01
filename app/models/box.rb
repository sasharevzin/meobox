class Box < ActiveRecord::Base
  validates :theme_title, :plan_id, presence: true
 
  has_many :items
  belongs_to :plan

  # custom writer, receives array of hash (attributes) for all items
  def item_attributes=(item_attributes)
    item_attributes.each do |attributes|
      items.find_or_create_by(attributes)
    end
  end
end
