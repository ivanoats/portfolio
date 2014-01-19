require "test_helper"

feature "CheckForZurb" do
  scenario "the test is sound" do
    visit root_path
    page.body.must_match /columns/
  end
end
