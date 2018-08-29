# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  email      :string
#  name       :string
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
  belongs_to :gallery
end
