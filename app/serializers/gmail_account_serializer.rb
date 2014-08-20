class GmailAccountSerializer < ActiveModel::Serializer
  attributes :id, :email, :authenticated
end