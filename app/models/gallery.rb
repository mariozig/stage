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
#
# Indexes
#
#  index_galleries_on_slug  (slug) UNIQUE
#

class Gallery < ApplicationRecord
  has_one :submission, dependent: :destroy
  has_many_attached :files
  has_many :comments, dependent: :destroy

  extend FriendlyId
  friendly_id :friendly_id_slug_candidates, use: [:history, :finders]

  def friendly_id_slug_candidates
    %i[title friendly_id_sequenced_title]
  end

  def friendly_id_sequenced_title
    slugged_title = title.parameterize
    sequence = Gallery.where('slug like ?', "#{slugged_title}-%").count + 2

    "#{slugged_title}-#{sequence}"
  end
end
