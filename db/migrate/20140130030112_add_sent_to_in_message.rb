class AddSentToInMessage < ActiveRecord::Migration
  def change
    add_column :messages, :sent_to, :integer, default: -1
  end
end
