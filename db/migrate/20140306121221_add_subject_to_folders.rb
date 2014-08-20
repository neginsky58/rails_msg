class AddSubjectToFolders < ActiveRecord::Migration
  def change
  	add_column :folders, :subject, :boolean, default: false
  end
end
