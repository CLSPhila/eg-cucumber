# Steps for confirming that things are visible in the browser window.



Then(/^I see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1) # Write code here that turns the phrase above into concrete actions
end

Then(/^I see a link to help information$/) do
  expect(page).to have_text("Help") # Write code here that turns the phrase above into concrete actions
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

Then(/^I see "You are logged in as" and my username$/) do
  page.has_content? "You are logged in as"
  expect(page).to have_text "You are logged in as #{$secrets[:browserusername]}"
end


Then(/^I see a form for entering information about a person\.$/) do
    expect(page).to have_text "Client's Name"
    expect(page).to have_text "Date of Birth"
    expect(page).to have_text "Address"
    expect(page).to have_text "Social Security Number"
    expect(page).to have_text "Search CPCMS for me"
    expect(page).to have_selector "form[action='expunge.php']"
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

Then(/^I see a table listing possible expungements$/) do
    expect(page).to have_xpath "//table//td"
end

Then(/^I see a link to download an expungement petition$/) do
    expect(page).to have_text "Download Petitions and Overview"
end

Then(/^individual dockets have valid links$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
