# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  description :text             default(""), not null
#  name        :string           not null
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#  index_categories_on_slug  (slug) UNIQUE
#

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[history finders]

  has_many :galleries

  default_scope { order(name: :asc) }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.default_category
    self.friendly.find('uncategorized')
  end
end
