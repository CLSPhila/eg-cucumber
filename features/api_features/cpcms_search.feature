Feature: Collect expungeable arrests by conducting a search of the CPCMS database

  Scenario: Generate a petition from a list of dockets
    Given (SKIP THIS) I have an otherwise valid request
    And createPetitions=1
    When the user makes a request from the api for a CPCMS search
    Then the api returns an object that validates against the schema
      """
      {
        "$schema": "http://json-schema.org/draft-04/schema#",
          "type":"object",
          "properties": {
            "personFirst":{"type":"string"},
            "personLast":{"type":"string"},
            "dob":{"type":"string"},
            "results":{
                "type":"object",
                "properties": {
                    "dockets":{"type":"array"},
                    "arrestCount":{"type":"intager"},
                    "sealing": {"type":"array"},
                    "expungementZip":{"type":"string"},
                    "expungements_redactions":{
                          "oneOf":[
                            {"type":"string"},
                            {"type":"array"}
                          ]
                    }
                },
                "required":["dockets","arrestCount","expungements_redactions"]
            }
          },
          "required":["personFirst","personLast","dob","results"]
      }
      """
     And the response code is 200

  Scenario: Generate a list of expungeable arrests from a list of dockets,
            but do not generate a petition.
    Given (SKIP THIS) I have an otherwise valid request
    And createPetitions=0
    When the user makes a request from the api for a CPCMS search
    Then the api returns an object that validates against the schema
      """
      {
        "$schema": "http://json-schema.org/draft-04/schema#",
          "type":"object",
          "properties": {
            "personFirst":{"type":"string"},
            "personLast":{"type":"string"},
            "dob":{"type":"string"},
            "results":{
                "type":"object",
                "properties": {
                    "dockets":{"type":"array"},
                    "arrestCount":{"type":"intager"},
                    "sealing": {"type":"array"},
                    "expungementZip":{"type":"string"},
                    "expungements_redactions":{
                          "oneOf":[
                            {"type":"string"},
                            {"type":"array"}
                          ]
                    }
                },
                "required":["dockets","arrestCount","expungements_redactions"]
            }
          },
          "required":["personFirst","personLast","dob","results"]
      }
      """
     And the response code is 200
