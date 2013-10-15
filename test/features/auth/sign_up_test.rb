require "test_helper"

feature(<<-EOF
  As a web developer
  I want to be able to sign up for an account on my website
  so that I can perform actions that require me to be logged in.
  EOF
) do

  scenario "sign up" do
    visit sign_up_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "Create Account"
    page.must_have_content "Sucessfully signed up"
    page.wont_have_content "There was a problem with your sign up"
  end
end
