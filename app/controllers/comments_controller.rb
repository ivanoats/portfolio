# Comments are short messages about blog posts
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @post
    else
      render template: "posts/show"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:author,
                                   :author_url,
                                   :author_email,
                                   :content,
                                   :referrer,
                                   :post_id)
  end
end
