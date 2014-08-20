class AddFieldToFolders < ActiveRecord::Migration
  def change
  	add_column :folders, :hexamail_status, :integer
  	add_column :folders, :have_plus, :boolean, default: false
  end
end
