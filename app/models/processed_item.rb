# == Schema Information
#
# Table name: processed_items
#
#  id                   :bigint           not null, primary key
#  receipt_id           :bigint           not null
#  converts_to_quantity :float
#  converts_to_scale    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  initial_quantity     :float
#  initial_scale        :string
#  name                 :string
#
class ProcessedItem < ApplicationRecord
  belongs_to :receipt

  def initial_to_conversion_ratio
    converts_to_quantity / initial_quantity
  end

  def cost_per_one_conversion_quantity
    receipt.cost_per_measurement / initial_to_conversion_ratio
  end

  def cost_per_one_conversion_quantity_formatted
    '%.6f' % cost_per_one_conversion_quantity + ' / ' + converts_to_scale
  end
end
