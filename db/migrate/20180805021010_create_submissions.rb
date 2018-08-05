class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.text :description, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
