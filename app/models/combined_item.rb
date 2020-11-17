class CombinedItem < ApplicationRecord
  belongs_to :receipt
  belongs_to :combined

  has_one :kitchen_item, through: :receipt

  delegate :name, to: :receipt
  delegate :cost_per_measurement, to: :receipt

  def cost
    quantity * cost_per_measurement
  end
end
