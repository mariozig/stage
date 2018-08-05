# == Schema Information
#
# Table name: submissions
#
#  id          :bigint(8)        not null, primary key
#  description :text             not null
#  email       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Submission < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :description, presence: true
end
