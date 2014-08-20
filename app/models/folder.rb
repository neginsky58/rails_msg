class Folder < ActiveRecord::Base
  has_many :canned_messages
  validates :name, presence: true, uniqueness: true
end
