# == Schema Information
#
# Table name: combineds
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Combined < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true

  has_many :combined_items

  def cost
    total = 0
    combined_items.each do |item|
      total += item.cost
    end
    total
  end

  def cost_per_quantity
    cost / quantity
  end
end
