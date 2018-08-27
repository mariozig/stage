class AddAdditionalFieldsToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :inbound_title, :string
    add_column :galleries, :inbound_description, :string
  end
end
