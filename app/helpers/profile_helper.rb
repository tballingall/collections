#
module ProfileHelper
  def edit_profile_link(user)
    return edit_profile_link! if current_user?(user)
    ''
  end

  def new_album_link(user)
    return new_album_link! if current_user?(user)
    ''
  end

  private

  def edit_profile_link!
    link_to edit_user_path(@user)
  end

  def new_album_link!
    link_to new_user_album_path(@user)
  end
end
