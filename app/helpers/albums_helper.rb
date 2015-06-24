#
module AlbumsHelper
  def update_album_link(album)
    return update_album_link!(album) if current_user?(album.user)
    ''
  end

  private

  def update_album_link!(album)
    link_to edit_album_path(album)
  end
end