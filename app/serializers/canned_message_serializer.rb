class CannedMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :hexamail_status, :folder_id, :default, :subject
  has_one :folder
end