class DefaultMessageSerializer < ActiveModel::Serializer
  attributes :id, :hexamail_status, :message, :language, :subject, :folder_id
end