Feature: Return helpful error messages when request data is missing or invalid.


# Missing required parameters.

  Scenario: Missing API key
    Given I have an otherwise valid request
    But I do not provide the api key
    When I submit my request
    Then the api returns
      """
      {
        "results":{
          "status": "Key missing from request."
        }
      }
      """

  Scenario: Missing user email
    Given I have an otherwise valid request
    But I have not provided an email address
    When I submit my request
    Then the api returns
      """
      {
        "results": {
          "status": "User email missing from request."
          }
      }
      """

  Scenario: Missing createPetitions flag
    Given I have an otherwise valid request
    But I have not included the createPetitions flag in my request
    When I submit my request
    Then the api returns
      """
      {
        "results":{
          "status": "Should I create petitions? Please include createPetitions=[0|1] in your request."
        }
      }
      """

# Invalid parameters

  Scenario: Invalid api key
    Given I have an otherwise valid request
    But I have an invalid api key
    When I submit my request
    Then the api returns
      """
      {
        "results": {
          "status": "Invalid request."
          }
      }
      """



  Scenario: User email not in database
    Given I have an otherwise valid request
    But I am using an email that has no account in the database
    When I submit my request
    Then the api returns
      """
      {
        "results": {
          "status": "Invalid request."
        }
      }
      """


  Scenario: CPCMS search set to false but no dockets provided.
    Given I have an otherwise valid request
    But I have set CPCMS to false and have not provided any docket numbers
    When I submit my request
    Then the api returns
      """
      {
        "results": {
          "status": "If you do not wish to do a CPCMS search, then you must supply docket numbers."
        }
      }
      """
