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
  find("input[type=submit]").click
end

Then(/^I see "You are logged in as" and my username$/) do
  page.has_content? "You are logged in as"
  expect(page).to have_text "You are logged in as #{$secrets[:browserusername]}"
end

Given(/^I have logged into the Expungement Generator as a user$/) do
  visit $secrets[:egurl]
  click_link("Login by clicking here.")
  fill_in "username", with: $secrets[:browseruseremail]
  fill_in "password", with: $secrets[:browseruserpass]
  find("input[type=submit]").click
end

Then(/^I see a form for entering information about a person\.$/) do
    expect(page).to have_text "Client's Name"
    expect(page).to have_text "Date of Birth"
    expect(page).to have_text "Address"
    expect(page).to have_text "Social Security Number"
    expect(page).to have_text "Search CPCMS for me"
    expect(page).to have_selector "form[action='expunge.php']"
end

When(/^I click the link "([^"]*)"$/) do |arg1|
    click_link arg1
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

When(/^I select the radio button "Search CPCMS for me"/) do
    choose('cpcmsSearch', :option=>'true')
end

When(/^I click the button "([^"]*)"$/) do |arg1|
    click_button(arg1)
end

Then(/^I see a table of docket numbers with links to the dockets$/) do
    expect(page).to have_text "Docket Sheets downloaded"
    expect(page).to have_xpath "//form[@action='expunge.php']/table/tbody/tr/td/a"
end

Then(/^I see a disclaimer about the limitations of the Generator$/) do
    expect(page).to have_text "DISCLAIMER!"
    expect(page).to have_text "The following is a list of known limitations"
end

Then(/^I see a link to the Summary Docket and MDJ Summary Docket$/) do
    expect(page).to have_xpath("//div/a[text()='Summary Docket']")
    expect(page).to have_xpath("//div/a[text()='MDJ Summary Docket']")
end

Then(/^I see a button to redo the cpcms search$/) do
    expect(page).to have_xpath "//form[@action='expunge.php']/div/input[@value='Redo CPCMS Search']"
end

Then(/^I see a button to expunge records$/) do
    expect(page).to have_xpath "//form[@action='expunge.php']/div/input[@value='Expunge']"
end
