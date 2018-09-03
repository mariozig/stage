# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text             not null
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gallery_id :bigint(8)        not null
#
# Indexes
#
#  index_comments_on_gallery_id  (gallery_id)
#
# Foreign Keys
#
#  fk_rails_...  (gallery_id => galleries.id) ON DELETE => cascade
#

class Comment < ApplicationRecord
  include Rakismet::Model
  rakismet_attrs author: :name, author_email: :email

  belongs_to :gallery

  validates :content, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
end
