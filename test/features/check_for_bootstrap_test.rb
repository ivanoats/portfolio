require "test_helper"

feature "As a developer I want a front-end framework so that I can easily modify the look and feel of my site" do
  focus
  scenario "check for bootstrap" do
    visit root_path
    page.body.must_match /col-/
  end
end
