require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given I am signed in as an editor
    sign_in(:editor)

    # And an existing post (from fixtures)
    visit posts_path

    # When the delete link is clicked
    post_title = page.find("table tr:last td:first").text
    page.find("table tr:last").click_on "Destroy"


    # Then the post is deleted
    page.wont_have_content post_title
  end
end
