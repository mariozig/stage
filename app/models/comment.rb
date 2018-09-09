# == Schema Information
#
# Table name: comments
#
#  id          :bigint(8)        not null, primary key
#  content     :text             not null
#  email       :string           not null
#  name        :string           not null
#  referrer    :string           not null
#  spam_status :integer          default("unchecked"), not null
#  user_agent  :string           not null
#  user_ip     :string           not null
#  user_role   :string           default("visitor"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gallery_id  :bigint(8)        not null
#
# Indexes
#
#  index_comments_on_gallery_id   (gallery_id)
#  index_comments_on_spam_status  (spam_status)
#
# Foreign Keys
#
#  fk_rails_...  (gallery_id => galleries.id) ON DELETE => cascade
#

class Comment < ApplicationRecord
  include Rakismet::Model
  rakismet_attrs author: :name, author_email: :email

  belongs_to :gallery

  enum spam_status: { unchecked: 0, is_spam: 1, not_spam: 2 }

  validates :content, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  def update_spam_status!
    spam? ? is_spam! : not_spam!
  end
end
