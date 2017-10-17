# Testing Harness for the Expungement Generator

[Github Pages Site](https://clsphila.github.io/eg-cucumber)

[Cucumber Tests](https://clsphila.github.io/eg-cucumber/tests)

[![Build Status](https://travis-ci.org/CLSPhila/eg-cucumber.svg?branch=master)](https://travis-ci.org/CLSPhila/eg-cucumber)

The Cucumber acceptance tests in this project run against instances of the [Expungement Generator](https://github.com/mhollander/Expungement-Generator).

While I may use these tests to make sure the Expungement Generator is working, you can use them to learn about how the generator is supposed to work.

Hopefully you find these tests useful.


# Using the Expungement Generator API to generate petitions

The basic interaction with EG API is a `POST` request to the api's url. The API can accept parameters either in the url of your request or in the body of the `POST`. There are a few parameters that every request should have.

    personFirst: "Joan"
    personLast: "ofArc"
    personDOB: "01/06/1431"
    current_user: "myownusername@somedomain.org"
    apikey: "alongstringofnumbersandletters"

**N.B. If you are configuring LegalServer to use the API, then you may need to set the api key as a parameter in the url of your request, not in the body of the `POST`**

## Now you have some choices to make.

### Do you want the api to search state court records for a person's name and date of birth?

Use the `cpcmsSearch` parameter.

    cpcmsSearch: "false"|"true"|"f"|"t"|0|1

If you choose "false", and do not want to do a search of state court records, you need to supply docket numbers for the generator to scrape. Use:

    docketNums: "CP-51-CR-01010101-2010,MC-51-CR-11001100-2001"

### Do you want the expungement generator to actually create expungements petitions for you as a zip file, or just tell you what arrests a person can have expunged?

Use the `createPetitions` parameter.

    createPetitions: "false"|"true"|"f"|"t"|0|1

### Should your petitions be emailed back to you?

    emailPetitions: false"|"true"|"f"|"t"|0|1

### What other information about the subject of the petition should be included in your generated documents?

If you are generating petitions, you can include information about the person for whom you are generating a petition that will be written into the petitions:

    personSSN: "111223333"
    personStreet: "123 Apt. 4b Blue St."
    personCity: "Rainbow City"
    personState: "AA"
    personZip: "123456"

## In summary,

### A request to the Generator looks like:

    apikey: "apikey"
    current_user: "uname@myorg.org"
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

### And the Generator's response looks like:

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
        "expungeZip":"https://www.eg-generator.org/eg-api-file-serve.php?filename=[somerandomfilename].zip" // if you selected createPetitions=1
        }
    }

If you selected `emailPetitions=1`, then your petitions will also be emailed to the address of `current_user`.

## How do I access petitions I have generated?

If you selected `emailPetitions=1`, then you will receive the petitions you generated at the address of `current_user`.

The JSON response will also include a link. You can use that link to download your petitions. __You must also include your api key in that request__. So a request for the file would have the base url of the Generator's site, the route `eg-apa-file-serve.php`, and the parameters `filename` and `apikey`.

You can also download the file through the browser interface of the site. Just go to the Generator, log in, and go to the path `secureServe.php`. Include the `filename` as a parameter in the url.

Petitions are deleted every day, so the file will not be available for long.

# Can I use the Expungement Generator API?

Right now, access is in a testing phase and is invitation-only.
