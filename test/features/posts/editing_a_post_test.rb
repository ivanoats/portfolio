require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post and a logged in author
    sign_in
    visit post_path(posts(:cr))

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end

  scenario "Only editors can publish" do
    # Given a new post
    # When I update the published checkbox to checked and save
    # Then the post will be published
    pending
  end

  scenario "Authors cannot publish" do
    # Given an author's post
    # When I visit the edit page
    # There is no checkbox for published
    pending
  end

  scenario "unauthenticated site vistiors cannot delete posts" do
    pending
  end
end
