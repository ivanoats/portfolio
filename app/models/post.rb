# A post is an article in the blog
class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable
  scope :published, -> { where(published: true) }

  # make a post readable by the public
  def publish!
    self.published = true
    save!
  end

  # test to see if a post was written by a user
  def authored_by?(user)
    author == user
  end

  # create a post from an incoming email
  def self.create_from_postmark(mitt)
    user = User.find_by_email(mitt.from)
    return false unless user
    post = user.posts.new
    # example, you could set an original message id
    # post.message_id = mitt.message_id
    post.title = mitt.subject
    post.body  = mitt.text_body.blank? ? mitt.html_body : mitt.text_body
    # example you could add a photo to the post with an attachment
    # post.photo = mitt.attachments.first.read unless mitt.attachments.empty?
    post.save
  end
end
