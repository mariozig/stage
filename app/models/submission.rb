# == Schema Information
#
# Table name: submissions
#
#  id          :bigint(8)        not null, primary key
#  description :text             not null
#  email       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gallery_id  :bigint(8)
#
# Indexes
#
#  index_submissions_on_gallery_id  (gallery_id)
#
# Foreign Keys
#
#  fk_rails_...  (gallery_id => galleries.id) ON DELETE => cascade
#

class Submission < ApplicationRecord
  belongs_to :gallery, optional: true
  has_many_attached :files

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :description, presence: true
  validate :files_types_validation

  ALLOWED_CONTENT_TYPES = [Mime::Type.lookup_by_extension("png").to_s, Mime::Type.lookup_by_extension("jpg").to_s, Mime::Type.lookup_by_extension("gif").to_s, Mime::Type.lookup_by_extension("bmp").to_s]

  def files_types_validation
    return unless files.attached?

    files.each do |file|
      content_type = file.blob.content_type
      unless ALLOWED_CONTENT_TYPES.include?(content_type) 
        file.purge
        errors[:base] << 'One of the images you uploaded is not a supported type' 
      end
    end
  end

end
