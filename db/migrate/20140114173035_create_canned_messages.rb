class CreateCannedMessages < ActiveRecord::Migration
  def change
    create_table :canned_messages do |t|
      t.text :message
      t.integer :hexamail_status
      t.boolean :default
      t.timestamps
    end
  end
end
