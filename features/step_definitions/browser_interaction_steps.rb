# Steps for interacting with the browser - navigating, filling out forms.

When(/^I visit the expungement generator site$/) do
  visit $secrets[:egurl]
end

When(/^I visit the expungement generator site lookup page$/) do
  visit $secrets[:egurl] + "/lookup.php"
end

When(/^I fill in a person's name, date of birth, address, and ssn$/) do
    fill_in "personFirst", with: $secrets[:testclientfirst]
    fill_in "personLast", with: $secrets[:testclientlast]
    fill_in "personDOB", with: $secrets[:testclientdob]
    fill_in "personStreet", with: "123 Fake St."
    fill_in "personCity", with: "Imaginaryville"
    fill_in "personState", with: "BS"
    fill_in "personZip", with: "12345"
    fill_in "personSSN", with: "123-12-1234"
end

When(/^I fill in a person's name and date of birth$/) do
  fill_in "personFirst", with: $secrets[:testclientfirst]
  fill_in "personLast", with: $secrets[:testclientlast]
  fill_in "personDOB", with: $secrets[:testclientdob]
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_link(arg1) # Write code here that turns the phrase above into concrete actions
end

When(/^I enter a valid user login$/) do
  fill_in "username", with: $secrets[:browsercurrent_user]
end


When(/^I enter a valid user password$/) do
  fill_in "password", with: $secrets[:browseruserpass]
end

When(/^I click login$/) do
  find("input[type=submit]").click
end

Given(/^I have logged into the Expungement Generator as a user$/) do
  visit $secrets[:egurl]
  click_link("Login by clicking here.")
  fill_in "username", with: $secrets[:browsercurrent_user]
  fill_in "password", with: $secrets[:browseruserpass]
  find("input[type=submit]").click
end

When(/^I click the link "([^"]*)"$/) do |arg1|
    click_link arg1
end



When(/^I select the radio button "Search CPCMS for me"/) do
    choose('cpcmsSearch', :option=>'true')
end

When(/^I click the button "([^"]*)"$/) do |arg1|
    click_button(arg1)
end
