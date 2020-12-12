# == Schema Information
#
# Table name: combined_items
#
#  id             :bigint           not null, primary key
#  quantity       :float
#  quantity_scale :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  combined_id    :bigint
#  itemable_type  :string
#  itemable_id    :bigint
#
class CombinedItem < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  belongs_to :combined

  delegate :name, to: :itemable

  def cost
    if itemable_type == 'Receipt'
      quantity * itemable.cost_per_measurement
    elsif itemable_type == 'Combined'
      quantity * itemable.cost_per_quantity
    else
      raise "Can't use this type"
    end
  end

  def cost_per_measurement
    if itemable_type == 'Receipt'
      itemable.cost_per_measurement
    elsif itemable_type == 'Combined'
      # TODO: make this naming convention the same for duck typing
      itemable.cost_per_quantity
    else
      raise "Can't use this type"
    end
  end
end
