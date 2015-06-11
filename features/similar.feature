Feature: Similar
  In order to use my app to get similar translations
  As a developer using Spinach
  I run the ha si command

  Scenario: Example command runs
    When I run `oversetter ha si --ssrc=eng --star=spa hello`
    Then the output should contain similar translations
    And the exit status should be 0
