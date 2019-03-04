
Given(/^I have a(n otherwise)? valid request$/) do |arg1|
  $params = {personFirst: $secrets[:testclientfirst],
             personLast: $secrets[:testclientlast],
            personDOB: $secrets[:testclientdob],
            personState: $secrets[:teststate],
            personStreet: "1234 SomeStreet",
            cpcmsSearch: "false",
            docketNums: $secrets[:docketnums].join(",") ,
            createPetitions: "0",
            apikey: $secrets[:apikey],
            current_user: $secrets[:current_user]}
end

Given(/^I do not provide the api key$/) do
  $params.reject!{ |k| k == :apikey }
end

Given(/^createPetitions=(\d+)$/) do |arg1|
  $params[:createPetitions] = arg1
end

Given(/^I have not included the createPetitions flag in my request$/) do
  $params.reject!{ |k| k == :createPetitions }
end

Given(/^I am using an email that has no account in the database$/) do
  $params[:current_user] =  "notarealemail@fake.fake"
end

Given(/^I have set CPCMS to false and have not provided any docket numbers$/) do
  $params[:cpcmsSearch] = 'false'
  $params.reject!{ |k| k==:docketNums }
end

Then(/^the api returns$/) do |response|
  expect(JSON.parse($resp.body)).to eq(JSON.parse(response))
end

When(/^I submit my request$/) do
  uri = URI.parse($secrets[:egurl] + '/eg-api.php')
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = $secrets[:usessl]
  req = Net::HTTP::Post.new(uri.path)
  req.set_form_data($params)
  $resp = https.request(req)
end

When(/^I send the request as json data$/) do
  uri = URI.parse($secrets[:egurl] + '/eg-api.php')
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.body = $params.to_json
  $resp = https.request(req)
end

When(/^I send the request with some parameters as json data and others as POST parameters,$/) do
  # Rats. I'm not sure how to send some data as POST and some as JSON in the request body.
  uri = URI.parse($secrets[:egurl] + '/eg-api.php')
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = $secrets[:usessl]
  current_user = $params.delete(:current_user)
  req = Net::HTTP::Post.new(uri.path)
  binding.pry
  req.body = $params.to_json
  req.set_form_data({:current_user => current_user})
  $resp = https.request(req)
end


Then(/^the api returns an object that validates against the schema$/) do |correctResponse|
  expect($params).not_to be_nil
  correctResponse = JSON.parse(correctResponse)
  $logger.info("logging the response from an api call.")
  $logger.info("Request params: ")
  $logger.info($params)
  $logger.info("-----------------------")
  $logger.info($resp.body.force_encoding("UTF-8"))
  $logger.info("-----------------------")
  expect(JSON.parse($resp.body.force_encoding("UTF-8"))).to \
    match_structure_of(correctResponse),  \
    log_schema_mismatch(JSON.parse($resp.body.force_encoding("UTF-8")))
end

Then(/^the response code is (\d+)$/) do |arg1|
    expect($resp.code).to eq(arg1.to_s)
end

Given(/^I have set emailAddressField to "([^"]*)"$/) do |arg1|
    $params[:emailAddressField] = arg1
end

Given(/^I have set id to a case number$/) do
    $params[:id] = $secrets[:id]
end

Given(/^I have set emailDomain to the domain I want to email to$/) do
    $params[:emailDomain] = $secrets[:emailDomain]
end


Then(/^the generator sends an email to an address made from the value of "([^"]*)" at the value of "([^"]*)"$/) do |arg1, arg2|
    expect($resp.code).to eq("200")
end
