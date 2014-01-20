require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content "Code Rails"
  end
end
