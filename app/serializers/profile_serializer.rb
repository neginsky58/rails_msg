class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :seeking_id, :name, :real_name, :city, :country,
             :email, :phone, :skype, :notes, :age, :height_in_ft,
             :height_in_cm, :body_type, :language, :education,
             :occupation, :ori, :expect, :facebook, :twitter,
             :tumblr, :blog, :watsapp, :wechat, :viber, :kik, :description,
             :seeking_url, :wink_url, :message_link, :last_login, :search_type,
             :wink_sent, :eye_color, :hair_color, :ethnicity, :marital_status,
             :smoking_habit, :drinking_habit, :summary, :i_expect, :arrangement_description,
             :hexamail_status, :profile_photo, :rating, :last_sent, :info_data, :message_data,
             :messages_sent, :messages_received, :local_option, :days_passed, :day_from_last_message, :admin
  has_many :photos, key: :photo_ids, root: :photos
  has_many :messages, key: :message_ids, root: :messages
  has_many :tags, key: :tag_ids, root: :tags
  embed :ids, include: true

  def admin
    scope.admin?
  end

  def day_from_last_message
     Profile.days_from_now object.last_sent rescue "--"
  end

  def profile_photo
    if object.main_photo
      object.main_photo.url
    else
      nil
    end
  end

  def ori
    if object.seeking == 'Sugar Daddy'
      'str'
    elsif object.seeking == 'Sugar Daddy AND Sugar Mommy'
      'bi'
    else
      object.seeking
    end 
  end

  def days_passed
    if object.last_received != nil
      ((Time.zone.now - object.last_received) / 1.day).to_i
    else
      '--'
    end
  end

end