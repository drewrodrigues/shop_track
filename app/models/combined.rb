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
end
