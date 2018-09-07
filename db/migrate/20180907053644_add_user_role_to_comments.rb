class AddUserRoleToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_role, :string, null: false, default: 'visitor'
  end
end
