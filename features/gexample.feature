Feature: Glosbe Example
  In order to use my app to get example usage
  As a developer using Spinach
  I run the gl ex command

  Scenario: Example command runs
    When I run `oversetter gl ex --esrc=eng --etar=spa hello`
    Then the output should contain an example
    And the exit status should be 0
