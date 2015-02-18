module ProfilesHelper
  def profile_picture(version=nil)
    if current_user.uid
      current_user.picture
    else
      current_user.profile_picture_file_name ? current_user.profile_picture.url(version) : "pilot.svg"
    end
  end

  def profile_picture_navbar(version=nil)
    if current_user.uid
      current_user.picture
    else
      current_user.profile_picture_file_name ? current_user.profile_picture.url(version) : "pilot_navbar.svg"
    end
  end

end
