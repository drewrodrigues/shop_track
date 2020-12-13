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
#  date            :date
#  category_id     :bigint
#
class Receipt < ApplicationRecord
  belongs_to :kitchen_item, optional: true
  belongs_to :category

  delegate :name, to: :kitchen_item, prefix: true

  validates :count, presence: true, if: :kitchen_item_receipt?
  validates :quantity, presence: true, if: :kitchen_item_receipt?
  validates :quantity_scale, presence: true, if: :kitchen_item_receipt?
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

  private

  def kitchen_item_receipt?
    !kitchen_item.nil?
  end
end
