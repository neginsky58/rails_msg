class AddAdminToFolders < ActiveRecord::Migration
  def change
  	add_column :folders, :admin, :boolean, default: false
  end
end
