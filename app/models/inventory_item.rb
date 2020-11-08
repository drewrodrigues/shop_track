class InventoryItem < ApplicationRecord
  belongs_to :kitchen_item

  delegate :name, to: :kitchen_item, prefix: true
  # def kitchen_item_name
  #   delegates_to
  #   kitchen_item.name
  # end
end
