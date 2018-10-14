class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ''

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
