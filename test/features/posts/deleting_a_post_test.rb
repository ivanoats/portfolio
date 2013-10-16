require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given a signed_in user
    sign_in_user

    # And an existing post
    visit posts_path

    # When the delete link is clicked
    # page.find("tr#post_#{posts(:cr).id}").click_on "Destroy"
    # or
    click_link("Destroy", href: "/posts/#{posts(:cr).id}")

    # Then the post is deleted
    page.wont_have_content "Code Rails"
    page.must_have_content posts(:cf).title
    page.must_have_content posts(:cz).title
  end
end
