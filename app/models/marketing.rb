# == Schema Information
#
# Table name: marketings
#
#  id         :bigint           not null, primary key
#  date_used  :date
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Marketing < ApplicationRecord
end
