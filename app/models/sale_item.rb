# == Schema Information
#
# Table name: sale_items
#
#  id         :bigint           not null, primary key
#  sale_id    :bigint           not null
#  pos_sum    :float
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :bigint
#
class SaleItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :sale

  validates :quantity, presence: true
  validate :at_least_1_quantity

  private

  def at_least_1_quantity
    if quantity <= 0
      errors.add(:quantity, 'must be at least 1')
    end
  end


end
