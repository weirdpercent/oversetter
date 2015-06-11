Feature: Glosbe
	In order to use my app to get translations
	As a developer using Spinach
	I run the gl tr command

	Scenario: Translate command runs
		When I run `oversetter gl tr --src=eng --tar=spa hello`
		Then the output should contain a Glosbe translation
		And the exit status should be 0
