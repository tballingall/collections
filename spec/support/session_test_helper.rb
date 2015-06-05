#
module SessionTestHelpers
  # Command: Creates a user and sets the user_id in session to the user's id
  #
  # @param [Hash]
  # @return [self]
  #
  def log_in(user)
    page.set_rack_session(user_id: user.id)
    user
  end
end
