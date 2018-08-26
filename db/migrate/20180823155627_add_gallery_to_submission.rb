class AddGalleryToSubmission < ActiveRecord::Migration[5.2]
  def change
    add_reference :submissions, :gallery, foreign_key: { on_delete: :cascade }
  end
end
