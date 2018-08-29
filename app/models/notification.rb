# == Schema Information
#
# Table name: notifications
#
#  id              :bigint(8)        not null, primary key
#  action          :string
#  notifiable_type :string
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  actor_id        :bigint(8)
#  notifiable_id   :bigint(8)
#  recipient_id    :bigint(8)
#

class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
  scope :recent, -> { order(created_at: :desc).limit(5) }

  def self.post(to:, from:, action:, notifiable:)
    recipients = Array.wrap(to)
    notifications = []

    Notification.transaction do
      notifications = recipients.uniq.each do |recipient|
        Notification.create(
          notifiable: notifiable,
          action:     action,
          recipient:  recipient,
          actor:      from
        )
      end
    end
    notifications
  end
end
