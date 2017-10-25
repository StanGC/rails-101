module PostsHelper
  def render_post_content(post)
    link_to(simple_format(post.content), group_post_path(post.group, post))
  end

  def render_post_created_at(post)
    post.created_at.strftime("%F %H:%m")
  end

  def render_post_updated_at(post)
    post.updated_at.to_s(:long)
  end

  def render_post_manage_button(group, post)
    if current_user && post.editable_by?(current_user)
      link_to("Edit", edit_group_post_path(post.group, post), class: "btn btn-sm") + " / " +
      link_to("Delete", group_post_path(post.group, post), class: "btn btn-sm", method: :delete, data: { confirm: "Are you sure ??" } )
    end
  end
end
