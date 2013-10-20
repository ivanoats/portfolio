# Author::    Ivan Storck and Brook Riggio
# Copyright:: Copyright (c) 2013 Code Fellows
# License::   All rights reseved. Contact us, we are flexible.
#
# A comment is a text entry about a post
class Comment < ActiveRecord::Base
# No longer needed b/c strong parameters gem but keeping for reference
#  attr_accessible :approved,
#                  :author,
#                  :author_email,
#                  :author_url,
#                  :content,
#                  :referrer,
#                  :user_agent,
#                  :user_ip
  belongs_to :post
end
