class AddFolderIdToDefaultMessages < ActiveRecord::Migration
  def change
  	add_column :default_messages, :folder_id, :integer
  end
end
