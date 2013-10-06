require "test_helper"

feature "AccessingHomePage" do
  scenario "displays the welcome message" do
    visit root_path
    page.must_have_content "Hello Code Fellows"
  end
end
