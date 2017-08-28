# Testing Harness for the Expungement Generator


The Cucumber acceptance tests in this project run against instances of the [Expungement Generator](https://github.com/mhollander/Expungement-Generator).

While I may use these tests to make sure the Expungement Generator is working, you can use them to learn about how the generator is supposed to work.

Hopefully you find these tests useful.


# Basic use of the Expungement Generator API

The basic interaction with EG API is a `POST` request to the api's url. The request can have the following parameters:

  personFirst: FirstName,
  personLast: LastName,
  personDOB: mm/dd/yyyy,
  personState: AA,
  cpcmsSearch: "false"|"true",
  docketNums: "Comma,separated,list",
  createPetitions: 0|1,
  apikey: apikey,
  useremail: username@org.org} 
