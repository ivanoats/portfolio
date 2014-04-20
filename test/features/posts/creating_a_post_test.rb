require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user complets a new post format
    sign_in(:author)
    visit new_post_path

    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body

    # When I submit the form
    click_on "Create Post"

    # Then a new unpublished post should be created and displayed
    page.text.must_include posts(:cr).title
    page.text.must_include posts(:cr).body
    assert page.has_css? "#author"
    page.text.must_include users(:author).email
    pending "status indicator"
    #TODO page.text.must_include "Status: Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('Published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    pending "status indicator"
    #TODO page.text.must_include "Status: Published"
  end
end
