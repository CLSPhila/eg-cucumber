
Given(/^I have an otherwise valid request$/) do
  $params = {personFirst: $secrets[:testclientfirst],
             personLast: $secrets[:testclientlast],
            personDOB: $secrets[:testclientdob],
            personState: $secrets[:teststate],
            cpcmsSearch: "false",
            docketNums: $secrets[:docketnums].join(",") ,
            createPetitions: 0,
            apikey: $secrets[:apikey],
            useremail: $secrets[:useremail]} # Write code here that turns the phrase above into concrete actions
end

Given(/^I do not provide the api key$/) do
  $params.reject!{ |k| k == :apikey }  # Write code here that turns the phrase above into concrete actions
end

Given(/^createPetitions=(\d+)$/) do |arg1|
  $params[:createPetitions] = arg1
end

Given(/^I have not included the createPetitions flag in my request$/) do
  $params.reject!{ |k| k == :createPetitions } # Write code here that turns the phrase above into concrete actions
end

Given(/^I am using an email that has no account in the database$/) do
  $params[:useremail] =  "notarealemail@fake.fake"# Write code here that turns the phrase above into concrete actions
end

Given(/^I have set CPCMS to false and have not provided any docket numbers$/) do
  $params[:cpcmsSearch] = 'false'
  $params.reject!{ |k| k==:docketNums } # Write code here that turns the phrase above into concrete actions
end

Then(/^the api returns$/) do |response|
  expect(JSON.parse($resp.body)).to eq(JSON.parse(response))
end

When(/^I submit my request$/) do
  uri = URI.parse($secrets[:egurl] + '/eg-api.php')
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.set_form_data($params)
  $resp = https.request(req) # Write code here that turns the phrase above into concrete actions
end
