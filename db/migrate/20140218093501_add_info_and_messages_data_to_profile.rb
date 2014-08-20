class AddInfoAndMessagesDataToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :info_data, :text, default: nil
    add_column :profiles, :message_data, :text, default: nil
  end
end