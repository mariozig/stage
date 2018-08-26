# == Schema Information
#
# Table name: galleries
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  publish_on  :date
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Gallery < ApplicationRecord
  has_one :submission, dependent: :destroy
end
