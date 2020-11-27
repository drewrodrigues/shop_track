# == Schema Information
#
# Table name: sales
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  pos_datetime      :datetime         not null
#  pos_total         :float            not null
#  pos_fiscal_number :string           not null
#
class Sale < ApplicationRecord
  has_many :sale_items, dependent: :destroy

  validates :pos_total, presence: true
  validates :pos_datetime, presence: true
  validates :pos_fiscal_number, presence: true, uniqueness: true

  def final_sale_price
    recipe.sale_price - discounted_amount
  end

  def discounted_amount
    (discount_percentage || 0) * recipe.sale_price
  end
end
