class ProfilesTags < ActiveRecord::Migration
  def change  
    create_table :profiles_tags do |t|
      t.belongs_to :profile
      t.belongs_to :tag
    end
  end
end
