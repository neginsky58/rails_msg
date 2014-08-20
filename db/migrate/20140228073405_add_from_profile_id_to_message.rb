class AddFromProfileIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :from_profile_id, :integer
  end
end
