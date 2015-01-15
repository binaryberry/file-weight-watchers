Feature: Logging in
	In order to see my files' weights
	As a human
	I want to open my session

	Scenario: logging in
		Given I am on the homepage
		When I fill in "email"
		And I fill in "password"
		Then I should see "You are now logged in to File Weight Watchers"
