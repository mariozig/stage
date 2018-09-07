class AddUserIpToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_ip, :string, null: false
  end
end
