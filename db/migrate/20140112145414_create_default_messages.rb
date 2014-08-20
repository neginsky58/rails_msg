class CreateDefaultMessages < ActiveRecord::Migration
  def change
    create_table :default_messages do |t|
      t.integer :language, :default => 0
      t.integer :hexamail_status
      t.text :message
      t.timestamps
    end
  end
end