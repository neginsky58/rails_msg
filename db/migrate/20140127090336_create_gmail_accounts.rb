class CreateGmailAccounts < ActiveRecord::Migration
  def change
    create_table :gmail_accounts do |t|
      t.string :email
      t.text :password
      t.boolean :authenticated, default: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
