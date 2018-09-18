class AddCategoryIdToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_reference :galleries, :category, null: false
  end
end
