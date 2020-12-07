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
#  discount   :float
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

  def self.average_per_day_of_week
    approx_weeks = Sale.group_by_day(:pos_datetime).count.length / 7
    total_per_day = SaleItem.joins(:sale).group_by_day_of_week(:pos_datetime, format: '%a', week_start: :mon).count
    total_per_day.map {|k, v| [k, v / approx_weeks]}.to_h
  end

  def self.average_per_day_in_last_days(num)
    total_items = SaleItem.joins(:sale).where('pos_datetime > ?', num.days.ago).sum(:quantity)
    total_items / num
  end

  def self.average_drinks_sold_per_day
    sales_per_day = SaleItem.joins(:sale).group_by_day(:pos_datetime).count(:name).values
    sales_per_day.reduce(:+) / sales_per_day.length
  end

  def self.sales_per_month
    sales_per_day = Sale.group_by_month(:pos_datetime).count(:name).values
    sales_per_day.reduce(:+) / sales_per_day.length
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
