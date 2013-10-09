require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts" do
    # Given existing posts

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include "Becoming a Code Fellow"
  end
end
