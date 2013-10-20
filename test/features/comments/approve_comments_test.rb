require "test_helper"

feature "As an author or editor
  I want to approve comments
  So that my blog does not have spam comments" do

  scenario "comments do not display until approved" do
    # Given a published post (in fixtures)
    # When a site visitor comments
    # The comment is unapproved
    # And does not display on the blog
    pending "comments"
  end

  scenario "Approve comments" do
    # Given a pending comment
    # When I visit the comment moderation page
    # I can approve comments
    # And the comments display on the blog
    pending "comments"
  end
end
