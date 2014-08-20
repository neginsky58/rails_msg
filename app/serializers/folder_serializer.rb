class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :collapse_href, :collapse_id,
             :collapse_href_one, :collapse_id_one,
             :collapse_href_full, :collapse_id_full, :subject, :have_plus, :hexamail_status, :admin
  has_many :canned_messages, key: :canned_message_ids, root: :canned_messages

  embed :ids, include: true

  def collapse_href
    "#folder-collapse-#{object.id}"
  end

  def collapse_id
    "folder-collapse-#{object.id}"
  end

  def collapse_href_one
    "#folder-collapse-#{object.id}-one"
  end

  def collapse_id_one
    "folder-collapse-#{object.id}-one"
  end

  def collapse_href_full
    "#folder-collapse-#{object.id}-full"
  end

  def collapse_id_full
    "folder-collapse-#{object.id}-full"
  end

  def have_plus
    object.have_plus    
  end

  def hexamail_status
    object.hexamail_status
  end  
end