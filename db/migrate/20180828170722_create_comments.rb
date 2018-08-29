class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.belongs_to :gallery, foreign_key: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
