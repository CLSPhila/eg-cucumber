Feature: Define the email address that should receive generated Petitions


    Scenario: Email generated petitions to a legalserver caseid.
        Given I have an otherwise valid request
        And I have set emailAddressField to "id"
        And I have set id to a case number
        And I have set emailDomain to the domain I want to email to
        And I have set cpcmsSearch to "False"
        And I have set createPetitions to 1
        And I have set emailPetitions to "True"
        When I submit my request to the expungement Generator
        Then the generator sends an email to an address made from the value of "id" at the value of "emailDomain"
