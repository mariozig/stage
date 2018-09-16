class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :email
      t.string :name
      t.text :content
      t.belongs_to :gallery, foreign_key: { on_delete: :cascade }, null: false
      t.belongs_to :report_reason, foreign_key: true, null: false

      t.timestamps
    end
  end
end
