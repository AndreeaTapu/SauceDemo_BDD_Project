Feature: Check the functionality of the login page

  Background:
    Given Login Page: I am on the saucedemo login page


  @T1 @loginSuccessful @regressionTesting
  Scenario: Check that you can login into the application when providing correct credentials
    When Login Page: I insert username "standard_user" and password "secret_sauce"
    When Login Page: I click the login button
    Then Inventory Page: I can login into the application and see the list of products


    @T2 @invalidLogin @regressionTesting
  Scenario Outline:  Check that you cannot login into the application when providing incorrect username
    When Login Page: I insert username "<username>" and password "<password>"
    When Login Page: I click the login button
    Then Login Page: I cannot login into the application and I receive error message "<error_message>"

    @ex1
    Examples:
      | username       | password           | error_message                                                             |  |  |
      | incorrect_user | secret_sauce       | Epic sadface: Username and password do not match any user in this service |  |  |
      | standard_user  | incorrect_password | Epic sadface: Username and password do not match any user in this service |  |  |

     @ex2
    Examples:
      | username       | password           | error_message                                                             |  |  |
      | incorrect_user | incorrect_password | Epic sadface: Username and password do not match any user in this service |  |  |

    Scenario: Check that the user can close the missing username or password error message
      When Login Page: I click the login button
      When I close the error message
      Then The error message is no longer visible on the website
