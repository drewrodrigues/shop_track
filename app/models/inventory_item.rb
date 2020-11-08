class InventoryItem < ApplicationRecord
  belongs_to :kitchen_item

  delegate :name, to: :kitchen_item, prefix: true

  def cost_per_item
    price / count
  end
end
