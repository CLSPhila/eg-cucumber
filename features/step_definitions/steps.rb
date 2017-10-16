
Given(/^I have an otherwise valid request$/) do
  $params = {personFirst: $secrets[:testclientfirst],
             personLast: $secrets[:testclientlast],
            personDOB: $secrets[:testclientdob],
            personState: $secrets[:teststate],
            personStreet: "1234 SomeStreet",
            cpcmsSearch: "false",
            docketNums: $secrets[:docketnums].join(",") ,
            createPetitions: 0,
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
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.set_form_data($params)
  $resp = https.request(req)
end


Then(/^the api returns an object that validates against the schema$/) do |correctResponse|
  expect($params).not_to be_nil
  correctResponse = JSON.parse(correctResponse)
  expect(JSON.parse($resp.body.force_encoding("UTF-8"))).to \
    match_structure_of(correctResponse),  \
    log_schema_mismatch(JSON.parse($resp.body.force_encoding("UTF-8")))
end

Then(/^the response code is (\d+)$/) do |arg1|
    expect($resp.code).to eq(arg1)
end
