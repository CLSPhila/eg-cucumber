# Testing Harness for the Expungement Generator

[Github Pages Site](https://clsphila.github.io/eg-cucumber)

[Cucumber Tests](https://clsphila.github.io/eg-cucumber/tests)

[![Build Status](https://travis-ci.org/CLSPhila/eg-cucumber.svg?branch=master)](https://travis-ci.org/CLSPhila/eg-cucumber)

The Cucumber acceptance tests in this project run against instances of the [Expungement Generator](https://github.com/mhollander/Expungement-Generator).

While I may use these tests to make sure the Expungement Generator is working, you can use them to learn about how the generator is supposed to work.

Hopefully you find these tests useful.


# Basic use of the Expungement Generator API

The basic interaction with EG API is a `POST` request to the api's url. The API can accept parameters either in the url of your request or in the body of the `POST`. There are a few parameters that every request should have.

    personFirst: "Joan"
    personLast: "ofArc"
    personDOB: "01/06/1431"
    useremail: "myownegusername"
    apikey: "alongstringofnumbersandletters"

**N.B. If you are configuring LegalServer to use the API, then you may need to set the api key as a parameter in the url of your request, not in the body of the `POST`**

Now you have some choices to make.

Do you want the api to search state court records for a person's name and date of birth? Use:

    cpcmsSearch: "false"|"true"

If you choose "false", and do not want to do a search of state court records, you need to supply docket numbers for the generator to scrape. Use:

    docketNums: "CP-51-CR-01010101-2010,MC-51-CR-11001100-2001"

Finally, do you want the expungement generator to actually create expungements petitions for you as a zip file, or just tell you what arrests a person can have expunged? Use:

    createPetitions: 0|1

And if you are generating petitions, you can include information about the person for whom you are generating a petition that will be written into the petitions:

    ssn: "111223333"
    street: "123 Apt. 4b Blue St."
    city: "Rainbow City"
    state: "AA"


In summary:

    apikey: "apikey"
    useremail: "uname@myorg.org"
    personFirst: "Joan"
    personLast: "ofArc"
    personDOB: "01/06/1431"
    personState: "FR"
    cpcmsSearch: "false"|"true"
    docketNums: "Comma,separated,list" # if cpcmsSearch == "false"
    createPetitions: 0|1
    ssn: "111223333"   # if createPetitions == 1
    street: "123 Apt. 4b Blue St."   # if createPetitions == 1
    city: "Rainbow City"  # if createPetitions == 1
    state: "AA"  # if createPetitions == 1

The api will return a simple JSON formatted string along the lines of

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
        "expungements_redactions": [
          {"case_number": "12345",
           "otns":"234",
           "action_taken":"Partial Expungement",
           "unpaid_costs_fines":"100",
           "unpaid_bail":"0.00",
           "date_order_received":"",
           "PSP":"",
           "local_police":""
          }
        ],
        "sealing":[
          {"case_number":"12345",
           "charge_name":"NA",
           "code_section":"Section 1234",
           "sealable":"NA",
           "additional_information": ""
          }
        ],
        "expungeZip":"https://www.eg-generator.org/JoanofArcExpungments.zip"
        }
    }

Right now, access is in a testing phase and is invitation-only.


# TODO

TODO cpcmsSearch and createDockets should use the same values for True/False.
