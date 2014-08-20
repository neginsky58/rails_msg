class AddLastSentToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :last_sent, :datetime
  end
end
