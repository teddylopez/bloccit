module TopicsHelper
  def user_is_authorized_for_topics?
    current_user && (current_user.moderator? || current_user.admin?)
  end
<<<<<<< HEAD
=======

  def user_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.moderator? || current_user.admin?)
  end

  def user_is_authorized_for_topics_action?(action)
    if action == :delete
      authorized = current_user && current_user.admin?
    else
      authorized = current_user && (current_user.moderator? || current_user.admin?)
    end
    return authorized
  end

>>>>>>> authorization
end
