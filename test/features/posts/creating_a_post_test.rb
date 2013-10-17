require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user complets a new post form
    sign_in
    visit new_post_path

    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
    assert page.has_css? "#author"
    page.text.must_include "By: #{users(:author).email}"
  end

  scenario "only editors can publish" do
    # Given an author's post
    # When I visit the edit page
    # There is no checkbox for published
    pending
  end

  scenario "unauthenticated site vistiors cannot create posts" do
    pending
  end

end
