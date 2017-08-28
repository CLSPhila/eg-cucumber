Feature: Collect expungeable arrests for a person from a list of docket numbers

  Scenario: Generate a petition from a list of dockets
    Given I have an otherwise valid request
    And createPetitions=1
    When the user makes a request from the api for a nonCPCMS search
    Then the api returns an object that looks like
      """
      {
        "personFirst": "<%=$secrets[:testclientfirst]%>",
        "personLast": "<%=$secrets[:testclientlast]%>",
        "dob": "<%=$secrets[:testclientdob]%>",
        "results": {
          "dockets": [
              "<%=$secrets[:docketnums][0]%>",
              "<%=$secrets[:docketnums][1]%>"
              ],
          "arrestCount": 1,
          "expungeZip": "<%=get_petitions_url()%>"
          }
      }
      """

  Scenario: Generate a list of expungable arrests but do not generate a petition.
    Given I have an otherwise valid request
    And createPetitions=0
    When the user makes a request from the api for a nonCPCMS search
    Then the api returns an object that looks like
      """
      {
        "personFirst": "<%=$secrets[:testclientfirst]%>",
        "personLast": "<%=$secrets[:testclientlast]%>",
        "dob": "<%=$secrets[:testclientdob]%>",
        "results": {
          "dockets": [
              "<%=$secrets[:docketnums][0]%>",
              "<%=$secrets[:docketnums][1]%>"
              ],
          "arrestCount": 1
          }
      }
      """
