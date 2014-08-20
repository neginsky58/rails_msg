class AddSubjectToDefaultMessage < ActiveRecord::Migration
  def change
    add_column :default_messages, :subject, :string
    add_column :canned_messages, :subject, :string
  end
end