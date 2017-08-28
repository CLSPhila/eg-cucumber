When(/^the user makes a request from the api for a CPCMS search$/) do
  uri = URI.parse('https://eg-test.clsphila.org/eg-api.php')
  params = {personFirst: $firstName,
            personLast: $lastName,
            personDOB: $dob,
            personCity: $city,
            personState: $state,
            cpcmsSearch: "true",
            apikey: $apikey,
            useremail: $useremail}
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.set_form_data(params)
  $resp = https.request(req)
end
