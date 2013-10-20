class Comment < ActiveRecord::Base
  attr_accessible :approved, :author, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip
end
