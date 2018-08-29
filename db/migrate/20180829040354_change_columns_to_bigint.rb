class ChangeColumnsToBigint < ActiveRecord::Migration[5.2]
  def up
    change_column :notifications, :recipient_id, :bigint
    change_column :notifications, :actor_id, :bigint
    change_column :notifications, :notifiable_id, :bigint
    change_column :friendly_id_slugs, :sluggable_id, :bigint
  end

  def down
    change_column :notifications, :recipient_id, :integer
    change_column :notifications, :actor_id, :integer
    change_column :friendly_id_slugs, :sluggable_id, :integer
   end
end
