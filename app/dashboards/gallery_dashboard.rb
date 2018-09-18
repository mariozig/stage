require 'administrate/base_dashboard'

class GalleryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    files: Field::ActiveStorage.with_options(destroy_path: 'gallery_file_path'),
    reports: Field::HasMany,
    comments: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    slug: Field::String,
    category: Field::BelongsTo,
    description: Field::Text,
    inbound_title: Field::String,
    inbound_description: Field::String,
    submission: Field::HasOne,
    publish_on: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    reports
    title
    slug
    category
    description
    inbound_title
    inbound_description
    submission
    comments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    slug
    category
    description
    inbound_title
    inbound_description
    files
    submission
    comments
    reports
    publish_on
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    title
    category
    description
    inbound_title
    inbound_description
    files
    publish_on
  ].freeze

  def display_resource(gallery)
    "Gallery ##{gallery.id} - #{gallery.title}"
  end

  def permitted_attributes
    super + [:submission] + [files: []]
  end
end
