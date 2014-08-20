class AddLastReceivedDate < ActiveRecord::Migration
  def change
    add_column :profiles, :last_received, :datetime, default: nil
  end
end
