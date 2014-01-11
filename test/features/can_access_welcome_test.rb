require "test_helper"

feature "CanAccessWelcome" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Hello Rails!"
    page.wont_have_content "Goobye All!"
  end
end
