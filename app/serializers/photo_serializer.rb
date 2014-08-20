class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :profile

  def profile
    object.profile_id
  end
end