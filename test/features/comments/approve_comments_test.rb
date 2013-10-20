require "test_helper"

feature "As an author or editor
  I want to approve comments
  So that my blog does not have spam comments" do

  def new_comment
    visit post_path(posts(:published))
    fill_in :comment_author,       with: "troll one"
    fill_in :comment_author_url,   with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_content,      with: "a dumb-ass comment"
    click_on "Submit comment for approval"
  end

  scenario "comments do not display until approved" do
    # Given a published post (in fixtures)
    # When a site visitor comments
    new_comment
    # The comment is unapproved
    # And does not display on the blog
    visit post_path(posts(:published))
    page.wont_have_content "dumb-ass"
  end

  scenario "Approve comments" do
    # Given a pending comment
    new_comment
    # When I visit the comment moderation page
    visit comments_path
    # I can approve comments
    comment_id = current_url.split('/').last
    click_link("Edit", href: "/comments#{comment_id}/edit")
    page.check "Approved"
    click_on "Update comment"
    # And the comments display on the blog
    visit post_path(posts(:published))
    page.must_have_content "dumb-ass"
  end
end
