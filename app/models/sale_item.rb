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
#  name       :string           not null
#  discount   :float            not null
#
class SaleItem < ApplicationRecord
  def self.per_day
    SaleItem.select("date(sales.pos_datetime)").joins(:sale).order("date(sales.pos_datetime) ASC").group("date(sales.pos_datetime)").count
  end

  def self.per_hour
    SaleItem.joins(:sale).group_by_hour_of_day('sales.pos_datetime').count.select { |_, v| v.positive? }
  end

  def self.per_day_of_week
    SaleItem.joins(:sale).group_by_day_of_week('sales.pos_datetime').count.select { |_, v| v.positive? }
  end

  # def self.average_sales_per_day
  #   SaleItem.joins(:sale).group_by_day_of_week('sales.pos_datetime').average("sales.pos_datetime")
  # end

  belongs_to :recipe, optional: true
  belongs_to :sale

  validates :quantity, presence: true
  validates :quantity, presence: true
  validate :at_least_1_quantity

  private

  def at_least_1_quantity
    if quantity <= 0
      errors.add(:quantity, 'must be at least 1')
    end
  end
end
