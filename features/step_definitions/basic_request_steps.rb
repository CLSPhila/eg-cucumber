
Given(/^I have an empty set of parameters for my request$/) do
    $params = {}
end

Given(/^a person's first name and last name$/) do
    $params[:personFirst] = $secrets[:testclientfirst]
end

Given(/^the person's date of birth$/) do
    $params[:personLast] = $secrets[:testclientlast]
end

Given(/^my Expungement Generator username$/) do
    $params[:useremail] = $secrets[:useremail]
end

Given(/^my organization's Expungement generator api key$/) do
    $params[:apikey] = $secrets[:apikey]
end

Given(/^I have set cpcmsSearch to "([^"]*)"$/) do |arg1|
    $params[:cpcmsSearach] = arg1
end

Given(/^I have a list of docket numbers to search$/) do
    $params[:docetNums] = $secrets[:docketnums].join(",")
end

Given(/^I have set createPetitions to (\d+)$/) do |arg1|
    $params[:createPetitions] = arg1
end

Given(/^I have set a social security number of "([^"]*)"$/) do |arg1|
    $params[:ssn] = arg1
end

Given(/^I have set a street of "([^"]*)"$/) do |arg1|
    $params[:street] = arg1
end

Given(/^I have set a city of "([^"]*)"$/) do |arg1|
    $params[:city] = arg1
end

Given(/^I have set a state of "([^"]*)"$/) do |arg1|
    $params[:state] = arg1
end

When(/^I submit my request to the expungement Generator$/) do
    uri = URI.parse($secrets[:egurl] + '/eg-api.php')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data($params)
    $resp = https.request(req)
end