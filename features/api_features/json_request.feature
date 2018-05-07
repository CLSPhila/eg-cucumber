Feature: Making requests with parameters sent as json data


    Scenario: All the data is sent as json
        Given I have a valid request
        When I send the request as json data
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

    Scenario: Some of the data is sent as json
        Given (SKIP THIS) I have a valid request
        When I send the request with some parameters as json data and others as POST parameters,
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
