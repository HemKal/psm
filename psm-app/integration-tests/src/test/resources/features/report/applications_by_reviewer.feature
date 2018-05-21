Feature: Applications by Reviewer Report
  Users wish to access the Applications by Reviewer report

  Scenario: Search Applications by Reviewer with No Results
    Given I am logged in as an admin
    And I am on the applications by reviewer page
    And I search for applications by reviewer between '01/01/2001' and '01/02/2001'
    Then I should see no results message

  Scenario: Search Applications by Reviewer Page with Results
    Given I am logged in as an admin
    And I am on the applications by reviewer page
    And I search for applications by reviewer between '01/01/2017' and '12/01/2017'
    Then I should see results

  Scenario: Search Applications by Reviewer Page without Dates with Results
    Given I am logged in as an admin
    And I am on the applications by reviewer page
    And I search for applications by reviewer with cleared dates
    Then I should see results

  Scenario: Download Applications by Reviewer CSV
    Given I am logged in as an admin
    And I am on the applications by reviewer page
    And I search for applications by reviewer between '01/01/2017' and '12/01/2017'
    And I download the applications by reviewer report
    Then I should have no errors
