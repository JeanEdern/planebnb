module ProfilesHelper
  def profile_picture(version=nil)
    current_user.uid ? current_user.picture : current_user.profile_picture.url(version)
  end
end
