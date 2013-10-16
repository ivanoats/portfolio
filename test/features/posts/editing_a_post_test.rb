require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # Given a signed_in user
    sign_in_user

    # And an existing post
    visit post_path(posts(:cr))

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
