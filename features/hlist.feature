Feature: Hablaa List
  In order to use my app to get supported languages
  As a developer using Spinach
  I run the ha li command

  Scenario: Example command runs
    When I run `oversetter ha li`
    Then the output should contain a language list
    And the exit status should be 0
