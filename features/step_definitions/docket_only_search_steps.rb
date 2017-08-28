Given(/^a client with first name ([a-zA-Z]+), last name ([a-zA-Z]+),$/) do |first, last|
  $firstName = first
  $lastName = last
end

Given(/^dob (\d+)\/(\d+)\/(\d+)$/) do |month, day, year|
  $dob =  "#{month}/#{day}/#{year}"# Write code here that turns the phrase above into concrete actions
end

Given(/^city ([a-zA-Z]+) and State ([A-Z]{2})$/i) do |city, state|
  $city = city
  $state = state
end

Given(/^docket numbers "([\S]+)"$/i) do |docketnums|
  $docketNums = docketnums
end

Given(/^a valid api key$/) do
  $apikey = $secrets[:apikey]
  $useremail = $secrets[:useremail]
end

When(/^the user makes a request from the api for a noncpcms search$/i) do
  #binding.pry
  uri = URI.parse("#{$secrets[:egurl]}/eg-api.php")
  $params[:cpcmsSearch] = "false"
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.set_form_data($params)
  $resp = https.request(req)
end

Then(/^the api returns an object that looks like$/) do |correctResponse|
  expect($params).not_to be_nil
  expect($resp.code).to match(/200/)
  correctResponse = JSON.parse(ERB.new(correctResponse).result(binding))
  expect(JSON.parse($resp.body)).to eq(correctResponse)
end
