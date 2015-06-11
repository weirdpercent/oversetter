Feature: Yandex
	In order to use my app to get translations
	As a developer using Spinach
	I run the ya tr command

	Scenario: Translate command runs
		When I run `oversetter ya tr --lang=en-es hello`
		Then the output should contain a Yandex translation
		And the exit status should be 0
