
RSpec::Matchers.define :match_structure_of do |expected|
    # A custom matcher for rspec to make sure the strucure of a response is right

    #TODO it should be recursive, not just two-level like this.
    match do |actual|
        expected.all? do |key, val|
            if expected[key].kind_of?(Hash)
                expected[key].all? do |subkey, subval|
                    begin
                        actual[key].has_key? subkey
                    rescue
                        false
                    end
                end
            else
                begin
                    actual.has_key? key
                rescue
                    false
                end
            end
        end
    end
end

def get_petitions_url
  # Helper method to build the url to petitions that the EG _ought_ to return.
  return "#{$secrets[:egurl]}/data/#{$secrets[:testclientfirst]}#{$secrets[:testclientlast]}Expungements.zip"
end
