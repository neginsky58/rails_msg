class MessageSerializer < ActiveModel::Serializer
  attributes :id, :subject, :body, :sent_date, :received, :profile, :sent_to

  def profile
    object.profile_id
  end

end