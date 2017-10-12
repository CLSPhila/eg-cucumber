

Given(/^I have an invalid api key$/) do
  $params[:apikey] = "invalidkey"
  $params[:current_user] = "test@clsphila.org"
end



Given(/^I have not provided an email address$/) do
  $params[:current_user] = ""
end
