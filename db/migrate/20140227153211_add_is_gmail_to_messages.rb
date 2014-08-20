class AddIsGmailToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :from_gmail, :boolean, :default => false
  end
end
