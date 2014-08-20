class SetupDefaultMessagesV1 < ActiveRecord::Migration
  def change
    add_column :default_messages, :user_id, :integer
  end
end
