Feature: Use lookup.php to search for dockets relating to a name without needing to log in.

  Scenario: Visit the EG webpage
    When I visit the expungement generator site lookup page
  	And I fill in a person's name and date of birth
    And I click the button "Search CPCMS"
    Then I see a table of docket numbers with links to the dockets
    And individual dockets have valid links
