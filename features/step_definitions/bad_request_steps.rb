

Given(/^I have an invalid api key$/) do
  $params[:apikey] = "invalidkey"
  $params[:useremail] = "test@clsphila.org"
end



Given(/^I have not provided an email address$/) do
  $params[:useremail] = ""
end
