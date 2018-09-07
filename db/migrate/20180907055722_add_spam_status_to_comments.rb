class AddSpamStatusToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :spam_status, :integer, null: false, default: 0
    add_index :comments, :spam_status
  end
end
