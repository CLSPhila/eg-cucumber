Feature: Use a browser to find expungeable arrests and generate an expungement petition.

	Scenario: Visit the EG webpage
		When I visit the expungement generator site
		Then I see "Login by clicking here."
		And I see a link to help information

	Scenario: Visit Log in page
		When I visit the expungement generator site
		And I click the link "Login by clicking here"
		Then I see a login page
		And I see an email address box
		And I see a password box

	Scenario: Log in as a valid user
		When I visit the expungement generator site
		And I click the link "Login by clicking here"
		And I enter a valid user login
		And I enter a valid user password
		And I click login
		Then I see "You are logged in as" and my username

	Scenario: Start a search for dockets
		Given I have logged into the Expungement Generator as a user
		When I click the link "Click here to start preparing expungement petitions"
		Then I see a form for entering information about a person.

	Scenario: Search for arrests with a CPCM searach
		Given I have logged into the Expungement Generator as a user
		When I click the link "Click here to start preparing expungement petitions"
		And I fill in a person's name, date of birth, address, and ssn
		And I select the radio button "Search CPCMS for me"
		And I click the button "Start Expunging"
		Then I see a table of docket numbers with links to the dockets
		And I see a disclaimer about the limitations of the Generator
		And I see a link to the Summary Docket and MDJ Summary Docket
		And I see a button to redo the cpcms search
		And I see a button to expunge records
