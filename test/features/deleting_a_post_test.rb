require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    page.find("tr#post_#{posts(:cr).id}").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content "Code Rails"
    page.must_have_content "Becoming a Code Fellow"
    page.must_have_content "JavaScript is cool, too"
  end
end
