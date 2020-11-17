# == Schema Information
#
# Table name: combined_items
#
#  id             :bigint           not null, primary key
#  receipt_id     :bigint           not null
#  quantity       :float
#  quantity_scale :string
#  combined_id    :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
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
