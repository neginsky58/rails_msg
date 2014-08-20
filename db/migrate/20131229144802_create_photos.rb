class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.boolean :main
      t.belongs_to :profile
      t.timestamps
    end
  end
end
