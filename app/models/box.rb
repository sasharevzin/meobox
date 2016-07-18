class Box < ActiveRecord::Base
  validates :theme_title, :plan_id, presence: true

  has_many :items
  belongs_to :plan

  paginates_per 5

  # custom writer, receives array of hash (attributes) for all items
  def item_attributes=(item_attributes)
    item_attributes.each do |attributes|
      items.find_or_create_by(attributes)
    end
  end

  def update_item_attributes=(item_attributes)
    items.delete_all    
    item_attributes.each do |attributes|
      items.create(attributes)
    end
  end

  def shipped?
    shipped == true
  end

  def self.search(search)
    if search.present?
       where(["theme_title LIKE ?","%#{search}%"])
    else
      all
    end
  end

end
