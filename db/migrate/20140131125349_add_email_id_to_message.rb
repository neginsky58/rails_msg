class AddEmailIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :email_identifier, :text, default: nil
  end
end
