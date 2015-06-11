Feature: Detect
	In order to use my app to get translations
	As a developer using Spinach
	I run the ya det command

	Scenario: Translate command runs
		When I run `oversetter ya det hello`
		Then the output should detect English
		And the exit status should be 0
