require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post, and an authenticated user
    sign_in
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

  scenario "an author can delete her own unpublished posts" do
    # Given a logged in author
    sign_in("author")
    # And a post by that author
    visit posts_path
    click_on "New Post"
    fill_in "Title", with: "author's title destroy test"
    fill_in "Body",  with: "author's body"
    click_on "Create Post"
    # figure out the post id from the page url
    post_id = current_url.split('/').last
    click_on "Back"
    click_link "Destroy", href: "/posts/#{post_id}"
    # Then I should see a message about the post being deleted
    page.must_have_content "Post was deleted"
    # And the post title should not be in the index
    page.wont_have_content "author's title destroy test"
  end

end
