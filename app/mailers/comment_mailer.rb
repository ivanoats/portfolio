class CommentMailer < ActionMailer::Base
  default from: "ivan@ivanstorck.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.NewComment.subject
  #
  def new_comment(comment, commentable)
    @comment = comment
    @commentable = commentable
    mail to: "ivan@ivanstorck.com"
  end
end
