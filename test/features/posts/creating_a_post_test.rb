require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user complets a new post format
    sign_in
    visit new_post_path

    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include posts(:cr).title
    page.text.must_include posts(:cr).body
    page.has_css? "#author"
    page.text.must_include users(:eli).email # Use your fixture name here.

  end
end
