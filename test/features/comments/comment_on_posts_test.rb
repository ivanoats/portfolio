require "test_helper"

feature "As a site visitor
  I want to comment on Blog Posts
  So that I can troll my friends" do

  scenario "comment on blog posts" do
    # Given a published post (in Fixtures)
    # When I visit the post
    visit post_path(posts(:published))
    # I can fill out a comment form
    fill_in :comment_author,       with: "troll one"
    fill_in :comment_author_url,   with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_content,      with: "a dumb-ass comment"
    click_on "Submit comment for approval"
    # And I should see comment pending moderation
    page.must_have_content "awaiting moderation"
  end
end
