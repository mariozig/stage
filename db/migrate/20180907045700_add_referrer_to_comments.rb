class AddReferrerToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :referrer, :string, null: false
  end
end
