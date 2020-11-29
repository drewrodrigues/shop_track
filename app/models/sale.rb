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
  def self.uah_per_day
    Sale.group_by_day(:pos_total).count
  end

  def self.per_day
    Sale.group_by_day(:pos_datetime).count
  end

  def self.per_hour
    Sale.group_by_hour(:pos_datetime).count.select { |_, v| v.positive?  }
  end

  def self.per_week
    Sale.group_by_week(:pos_datetime).count
  end

  def self.average_sale_during_time
    total_hours = Sale.group_by_day(:pos_datetime).count.length / 8
    sales_per_day = SaleItem.joins(:sale).group_by_hour_of_day(:pos_datetime, series: false).count
    sales_per_day.map {|k, v| [k, v / total_hours]}.to_h.reject {|k, v| v < 1}
  end

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
