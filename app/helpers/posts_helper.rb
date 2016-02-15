# Posts helper
module PostsHelper
  def require_user
  current_user == @post.user
  end

  def favourite_post(post)
    if current_user && current_user.favourite_posts.map(&:post).include?(post)
    'text-danger'
    else
    'text-muted'
    end
  end
end