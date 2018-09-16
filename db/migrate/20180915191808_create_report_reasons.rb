class CreateReportReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :report_reasons do |t|
      t.string :content, null: false
      t.integer :position, null: false

      t.timestamps
    end
    add_index :report_reasons, :position, unique: true
  end
end
