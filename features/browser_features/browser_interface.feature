Feature: Use a browser to find expungeable arrests and generate an expungement petition.

	Scenario: Visit the EG webpage
		When I visit the expungement generator site
		Then I see "Login by clicking here."
		And I see a link to help information

	Scenario: Visit Log in page
		When I visit the expungement generator site
		And I click "Login by clicking here"
		Then I see a login page
		And I see an email address box
		And I see a password box

	Scenario: Log in as a valid user
		When I visit the expungement generator site
		And I click "Login by clicking here"
		And I enter a valid user login
		And I enter a valid user password
		And I click login
		Then I see "You are logged in as" and my username
