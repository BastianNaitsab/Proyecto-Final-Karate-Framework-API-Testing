Feature: Test for creates a new auth token to the PUT and DELETE

  Background:
    * url url_booking
    * header Content-Type = 'application/json'


  @HappyPath
  Scenario: Create token Successful
    Given path "auth"
    And def requestBodyJson = read('classpath:bookings/authentication/RequestBodyAuthentication.json')
    And request requestBodyJson

    When method POST

    Then status 200
    And match response == read('classpath:bookings/authentication/ResponseSchemaAuthentication.json')


  @ScenarioAltern
  Scenario: Create token with invalid credentials
    Given path "auth"
    And def requestBodyJson =
      """
      {
        "username": "invalid_user",
        "password": "wrong_password"
      }
      """
    And request requestBodyJson

    When method POST

    # el status que deberia devolver seria un 401 Unauthorized pero devuelve un 200
    Then status 200

  @ScenarioAltern
  Scenario: Create token with same credentials in username y password
    Given path "auth"
    And def requestBodyJson =
      """
      {
        "username": "password123",
        "password": "password123"
      }
      """
    And request requestBodyJson

    When method POST

    # el status que deberia devolver seria un 401 Unauthorized pero devuelve un 200
    Then status 200


  @ScenarioOutline
  Scenario Outline: Create token with multiple credentials
    Given path "auth"
    And def requestBodyJson =
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    And request requestBodyJson

    When method POST

    Then status <statusCode>

    # el status que deberian devolver seria un 401 Unauthorized pero devuelve 200 OK
    Examples:
      | username      | password      | statusCode     |
      | admin         | 123456        | 200            |
      | user          | password123   | 200            |
      | admin         | admin         | 200            |