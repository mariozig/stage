# == Schema Information
#
# Table name: galleries
#
#  id                  :bigint(8)        not null, primary key
#  description         :text
#  inbound_description :string
#  inbound_title       :string
#  publish_on          :date
#  slug                :string           not null
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :bigint(8)        not null
#
# Indexes
#
#  index_galleries_on_category_id  (category_id)
#  index_galleries_on_slug         (slug) UNIQUE
#

class Gallery < ApplicationRecord
  WATERMARK_PATH = Rails.root.join('app', 'assets', 'images', 'sample_watermark.png')

  extend FriendlyId
  friendly_id :friendly_id_slug_candidates, use: %i[history finders]
  searchkick

  belongs_to :category
  has_one :submission, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many_attached :files

  def friendly_id_slug_candidates
    %i[title friendly_id_sequenced_title]
  end

  def friendly_id_sequenced_title
    slugged_title = title.parameterize || 'untitled'
    sequence = Gallery.where('slug like ?', "#{slugged_title}-%").count + 2

    "#{slugged_title}-#{sequence}"
  end

  def import_files_from_submission!
    self.submission.files.each do |file|
      self.files << file
    end
  end

  # scopes
  def self.published
    where(arel_table[:publish_on].lteq(Date.today))
  end

  def self.by_publish_on
    order(publish_on: :asc)
  end

  def self.default_order
    published.by_publish_on
  end
end
