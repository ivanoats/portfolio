require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    # Given a a couple of projects (loaded from fixtures)
    # When I visit /projects
    visit projects_path
    # Then I should see a list of projects
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Project Name Two"
  end
end
