class AddSlugToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :slug, :string, null: false
    add_index :galleries, :slug, unique: true
  end
end
