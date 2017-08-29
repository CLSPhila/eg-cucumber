# Testing Harness for the Expungement Generator

[Github Pages Site](https://clsphila.github.io/eg-cucumber)

[Cucumber Tests](https://clsphila.github.io/eg-cucumber/tests)

[![Build Status](https://travis-ci.org/CLSPhila/eg-cucumber.svg?branch=master)](https://travis-ci.org/CLSPhila/eg-cucumber)

The Cucumber acceptance tests in this project run against instances of the [Expungement Generator](https://github.com/mhollander/Expungement-Generator).

While I may use these tests to make sure the Expungement Generator is working, you can use them to learn about how the generator is supposed to work.

Hopefully you find these tests useful.


# Basic use of the Expungement Generator API

The basic interaction with EG API is a `POST` request to the api's url. There are a few parameters that every request should have.

These parameters should be sent in the body of the `POST` request:

    personFirst: "Joan"
    personLast: "ofArc"
    personDOB: "01/06/1431"
    personState: "FR"
    username: "myownegusername"

These parameters should be sent in the request's url:

    apiemail: "legalservices@burgundy.fr"
    apikey: "alongstringofnumbersandletters"

** N.B. The api uses `apiemail` and `apikey` to authenticate a user, and these parameters go in the url itself. The api uses the `username` parameter, in the body of the `POST` request, to figure out whose name should be typed into petitions that are generated. The `username` must be someone who has their own individual account in the Expungement Generator. ** [^names]

[^names]: Yes, you could get the api to generate petitions with someone's name other than yours by putting someone else's username here. We're only generating text files here anyway, so that has always been possible.

Now you have some choices to make.

Do you want the api to search state court records for a person's name and date of birth? In the body of the `POST`, use:

    cpcmsSearch: "false"|"true"

If you choose "false", and do not want to do a search of state court records, you need to supply docket numbers for the generator to scrape. In the body of the `POST`, use:

    docketNums: "Comma,separated,list"

Finally, do you want the expungement generator to actually create expungements petitions for you as a zip file, or just tell you what arrests a person can have expunged? In the body of the `POST`, use:

    createPetitions: 0|1

In summary: 

    #URLS params
    apikey: apikey,
    useremail: username@org.org


    #POST body params
    personFirst: Joan,
    personLast: ofArc,
    personDOB: 01/06/1431,
    personState: FR
    cpcmsSearch: "false"|"true",
    docketNums: "Comma,separated,list",
    createPetitions: 0|1,

The api will return a simple JSON formatted string along the lines of

    {
      "personFirst": "Joan",
      "personLast": "ofArc",
      "dob": "01/06/1431",
      "results": {
        "arrestCount": 1,
        "expungeZip": "https://www.eggenerator.org/JoanofArcExpungments.zip"
        }
    }

Right now, access is in a testing phase and is invitation-only.


TODO cpcmsSearch and createDockets should use the same values for True/False.
