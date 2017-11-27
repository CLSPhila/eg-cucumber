
RSpec::Matchers.define :match_structure_of do |schema|
    # A custom matcher for rspec to make sure the strucure of a response is right

    #TODO it should be recursive, not just two-level like this.
    match do |actual|
        JSON::Validator.validate(schema, actual)
    end
end

def get_petitions_url
  # Helper method to build the url to petitions that the EG _ought_ to return.
  return "#{$secrets[:egurl]}/data/#{$secrets[:testclientfirst]}#{$secrets[:testclientlast]}Expungements.zip"
end

def log_schema_mismatch(json_resp)
    $logger.fatal("Schema mismatch for:")
    $logger.fatal(JSON.pretty_generate(json_resp))
    return "Schema did not match the response. See log for details."
end
