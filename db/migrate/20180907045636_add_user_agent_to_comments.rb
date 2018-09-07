class AddUserAgentToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_agent, :string, null: false
  end
end
