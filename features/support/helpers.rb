def get_petitions_url
  # Helper method to build the url to petitions that the EG _ought_ to return.
  return "#{$secrets[:egurl]}/data/#{$secrets[:testclientfirst]}#{$secrets[:testclientlast]}Expungements.zip"
end
