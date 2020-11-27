# == Schema Information
#
# Table name: kitchen_items
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class KitchenItem < ApplicationRecord
  default_scope { order(name: :asc) }
end
