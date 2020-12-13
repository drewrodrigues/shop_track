# == Schema Information
#
# Table name: receipts
#
#  id              :bigint           not null, primary key
#  kitchen_item_id :bigint           not null
#  count           :integer
#  quantity        :float
#  price           :float
#  quantity_scale  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Receipt < ApplicationRecord
  belongs_to :kitchen_item, optional: true

  delegate :name, to: :kitchen_item, prefix: true

  validates :quantity, presence: true
  validates :price, presence: true

  def cost_per_item
    price / count
  end

  def cost_per_measurement
    cost_per_item / quantity
  end

  def name
    kitchen_item.name
  end
end
