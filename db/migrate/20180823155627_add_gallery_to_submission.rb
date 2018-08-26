class AddGalleryToSubmission < ActiveRecord::Migration[5.2]
  def change
    add_reference :submissions, :gallery, foreign_key: true
  end
end
