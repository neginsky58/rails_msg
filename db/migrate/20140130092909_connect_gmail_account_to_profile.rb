class ConnectGmailAccountToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gmail_account_id, :integer, default: nil
  end
end
