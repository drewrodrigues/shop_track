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
