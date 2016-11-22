module ApplicationHelper

  def name_or_email (comment)
    comment.user.name ? comment.user.name : comment.user.email
  end

end
