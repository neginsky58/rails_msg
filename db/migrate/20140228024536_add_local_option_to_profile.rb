class AddLocalOptionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :local_option, :boolean, :default => false 
  end
end
