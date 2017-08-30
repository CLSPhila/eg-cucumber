Feature: Making a basic request to the Expungement Generator api

    Scenario: Making a simple request
        Given I have an empty set of parameters for my request
        And a person's first name and last name
        And the person's date of birth
        And my Expungement Generator username
        And my organization's Expungement generator api key
        And I have set cpcmsSearch to "false"
        And I have a list of docket numbers to search
        And I have set createPetitions to 1
        And I have set a social security number of "111223333"
        And I have set a street of "123 Apt. 4b Blue St."
        And I have set a city of "Rainbow City"
        And I have set a state of "AA"
        And I have set a zip of "12345"
        When I submit my request to the expungement Generator
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
