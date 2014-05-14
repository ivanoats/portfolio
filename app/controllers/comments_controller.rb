# Comments are short messages about blog posts
class CommentsController < ApplicationController
  before_filter :load_commentable, except: [:index]

  def index
    authorize Comment
    @comments = Comment.all
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @commentable
      # TODO: send editors an email with the comment and a link to approve
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def update
    if @commentable.class == Comment
      @comment_thing = @commentable
    else
      @comment_thing = @commentable.comment
    end

    if @comment_thing.update_attributes(comment_params)
      flash[:notice] = "Comment has been updated"
      if @comment_thing.class == Comment
        redirect_to comments_path
      else
        redirect_to @commentable
      end
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author,
                                    :author_url,
                                    :author_email,
                                    :content,
                                    :referrer,
                                    :approved,
                                    :commentable_id)
  end

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
