class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :subject
      t.text :body
      t.datetime :sent_date
      t.boolean :received
      t.belongs_to :profile
      
      t.timestamps
    end
  end
end
