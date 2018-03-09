Feature: Request a file from the api

    Scenario: Make a valid request to download an expungement petition.
        Given I know a particular petition has been generated
        And I request that petition using the right apikey and username
        Then I receive the file in respose
        And the response code is 200
