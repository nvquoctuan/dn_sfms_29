module CommentsHelper
  def comments_child parent_id
    @comments.parent_comment parent_id
  end

  def check_parent comment
    return if comment.id_parent

    comment
  end
end
