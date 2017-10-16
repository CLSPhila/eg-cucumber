Given(/^I know a particular petition has been generated$/) do
    params = {personFirst: $secrets[:testclientfirst],
              personLast: $secrets[:testclientlast],
              personDOB: $secrets[:testclientdob],
              personState: $secrets[:teststate],
              personStreet: "1234 SomeStreet",
              personCity: "Some City",
              personZip: "12345",
              cpcmsSearch: "false",
              docketNums: $secrets[:docketnums].join(",") ,
              createPetitions: 1,
              apikey: $secrets[:apikey],
              current_user: $secrets[:current_user]}
    uri = URI.parse($secrets[:egurl] + '/eg-api.php')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(params)
    resp = https.request(req)
    resp = JSON.parse(resp.body.force_encoding("UTF-8"))
    $filename = resp['results']['expungeZip']
end

Given(/^I request that petition using the right apikey and username$/) do
    uri = URI.parse($secrets[:egurl] + '/eg-api-file-serve.php')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    params = {filename: $filename,
              apikey: $secrets[:apikey],
              current_user: $secrets[:current_user]}
    req.set_form_data(params)
    $resp = https.request(req)
end

Then(/^I receive the file in respose$/) do
    expect($resp.content_type).to eq("application/octet-stream")
    expect($resp.content_length).to be >= 100000
end
