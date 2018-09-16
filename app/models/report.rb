# == Schema Information
#
# Table name: reports
#
#  id               :bigint(8)        not null, primary key
#  content          :text
#  email            :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gallery_id       :bigint(8)        not null
#  report_reason_id :bigint(8)        not null
#
# Indexes
#
#  index_reports_on_gallery_id        (gallery_id)
#  index_reports_on_report_reason_id  (report_reason_id)
#
# Foreign Keys
#
#  fk_rails_...  (gallery_id => galleries.id) ON DELETE => cascade
#  fk_rails_...  (report_reason_id => report_reasons.id)
#

class Report < ApplicationRecord
  belongs_to :gallery
  belongs_to :report_reason

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :gallery, presence: true
  validates :report_reason, presence: true
end
