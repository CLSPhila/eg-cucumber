When(/^I visit the expungement generator site$/) do
  visit $secrets[:egurl]
end

Then(/^I see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1) # Write code here that turns the phrase above into concrete actions
end

Then(/^I see a link to help information$/) do
  expect(page).to have_text("Help") # Write code here that turns the phrase above into concrete actions
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_link(arg1) # Write code here that turns the phrase above into concrete actions
end

Then(/^I see a login page$/) do
  expect(page).to have_current_path("/login.php")
end

Then(/^I see an email address box$/) do
  expect(page).to have_selector("input[name=username]") # Write code here that turns the phrase above into concrete actions
end

Then(/^I see a password box$/) do
  expect(page).to have_selector("input[type=password]") # Write code here that turns the phrase above into concrete actions
end


When(/^I enter a valid user login$/) do
  fill_in "username", with: $secrets[:browseruseremail]
end


When(/^I enter a valid user password$/) do
  fill_in "password", with: $secrets[:browseruserpass]
end

When(/^I click login$/) do
  find("input[type=password]").click
end

Then(/^I see "You are logged in as" and my username$/) do
  page.has_content? "You are logged in as"
  expect(page).to have_text "You are logged in as #{$secrets[:browserusername]}"
end
