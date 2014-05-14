class CommentMailerPreview < ActionMailer::Preview
  def new_comment
    @comment = Comment.create content: "test comment",
      author_email: "testauthor@example.com",
      author: "test comment author"
  
    @commentable = Post.create published: true
    
    CommentMailer.new_comment(@comment,@commentable)
  end
end