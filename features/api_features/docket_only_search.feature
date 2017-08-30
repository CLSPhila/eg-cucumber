Feature: Collect expungeable arrests for a person from a list of docket numbers

  Scenario: Generate a petition from a list of dockets
    Given I have an otherwise valid request
    And createPetitions=1
    When the user makes a request from the api for a nonCPCMS search
    Then the api returns an object that looks like
        """
        {
          "personFirst": "Joan",
          "personLast": "ofArc",
          "dob": "01/06/1431",
          "results": {
            "dockets": [
                "DOCKET1",
                "DOCKET2"
                ],
            "arrestCount": 1,
            "expungeZip":"https://www.eg-generator.org/JoanofArcExpungments.zip"
            }
        }
        """
     And the response code is 200

  Scenario: Generate a list of expungable arrests but do not generate a petition.
    Given I have an otherwise valid request
    And createPetitions=0
    When the user makes a request from the api for a nonCPCMS search
    Then the api returns an object that looks like
        """
        {
          "personFirst": "Joan",
          "personLast": "ofArc",
          "dob": "01/06/1431",
          "results": {
            "dockets": [
                "DOCKET1",
                "DOCKET2"
                ],
            "arrestCount": 1
            }
        }
        """
     And the response code is 200
