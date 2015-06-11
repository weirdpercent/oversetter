Feature: Hablaa Example
  In order to use my app to get example usage
  As a developer using Spinach
  I run the ha ex command

  Scenario: Example command runs
    When I run `oversetter ha ex --esrc=eng --etar=spa hello`
    Then the output should contain an example
    And the exit status should be 0
