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

When(/^I enter a valid user password$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click login$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I don't know what happens\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
