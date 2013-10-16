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
  # def update?
  #   user.author? || user.editor?
  # end

  def destroy?
    user.editor?
  end

  def publish?
    user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.author? || user.editor?
        scope
      else
        scope.where(published: true)
      end
    end
  end
end
