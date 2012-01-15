Feature: Login Manageer
	In order to create and manage applictions
	As a user
	I want a fully functioning login system

Scenario Outline: Show user profile or ask to log in
	Given the following user records
	| first_name | password | admin |
	| bob | secret | false |
	| admin | secret | true |
	Given I am logged in as "<login>" with password "secret"
	When I visit the root path
	Then I should <action>

	Examples:
	| login | action |
	| admin | not see "Sign up" |
	| bob | not see "Sign up" |
	| | see "Sign up" |