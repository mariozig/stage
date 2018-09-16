# == Schema Information
#
# Table name: report_reasons
#
#  id         :bigint(8)        not null, primary key
#  content    :string           not null
#  position   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_report_reasons_on_position  (position) UNIQUE
#

class ReportReason < ApplicationRecord
  default_scope { order(position: :asc) }
end
