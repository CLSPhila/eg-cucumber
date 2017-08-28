# Testing Harness for the Expungement Generator

[Github Pages Site](https://clsphila.github.io/eg-cucumber)

[Cucumber Tests](https://clsphila.github.io/eg-cucumber/tests)

[![Build Status](https://travis-ci.org/CLSPhila/eg-cucumber.svg?branch=master)](https://travis-ci.org/CLSPhila/eg-cucumber)

The Cucumber acceptance tests in this project run against instances of the [Expungement Generator](https://github.com/mhollander/Expungement-Generator).

While I may use these tests to make sure the Expungement Generator is working, you can use them to learn about how the generator is supposed to work.

Hopefully you find these tests useful.


# Basic use of the Expungement Generator API

The basic interaction with EG API is a `POST` request to the api's url. The request can have the following parameters:

    personFirst: Joan,
    personLast: ofArc,
    personDOB: 01/06/1431,
    personState: FR,
    cpcmsSearch: "false"|"true",
    docketNums: "Comma,separated,list",
    createPetitions: 0|1,
    apikey: apikey,
    useremail: username@org.org}

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
