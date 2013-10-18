# Author::    Ivan Storck and Brook Riggio
# Copyright:: Copyright (c) 2013 Code Fellows
# License::   All rights reseved. Contact us, we are flexible.
#
# A Post is an individual entry in the blog
class Post < ActiveRecord::Base

  belongs_to :author, class_name: "User"

  def publish!
    published = true
    save!
  end
end
