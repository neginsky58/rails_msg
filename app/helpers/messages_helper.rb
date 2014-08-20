module MessagesHelper
  def tag_list(profile)
    profile.tags.map{ |t| t.name }.join(",") if profile.tags.count > 0
  end
end