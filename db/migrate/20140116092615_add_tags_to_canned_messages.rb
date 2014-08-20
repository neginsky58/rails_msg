class AddTagsToCannedMessages < ActiveRecord::Migration
  def change
    add_column :canned_messages, :folder_id, :integer
  end
end
