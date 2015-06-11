Feature: Hablaa
	In order to use my app to get translations
	As a developer using Spinach
	I run the ha tr command

	Scenario: Translate command runs
		When I run `oversetter ha tr --src=eng --tar=spa hello`
		Then the output should contain an Hablaa translation
		And the exit status should be 0
