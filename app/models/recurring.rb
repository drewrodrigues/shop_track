# == Schema Information
#
# Table name: recurrings
#
#  id         :bigint           not null, primary key
#  name       :string
#  cost       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Recurring < ApplicationRecord
end
