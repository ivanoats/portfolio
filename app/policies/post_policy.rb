# A post policy is a Pundit class to manage blog posts
class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.author? || user.editor?
  end
  alias_method :update?, :create?

  def destroy?
    user.editor?
  end

  def publish?
    user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(author_id: user.id)
      else
        scope.where(published: true)
      end
    end
  end
end
