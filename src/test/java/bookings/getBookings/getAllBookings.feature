Feature: Tests for all get bookings by id, all,...

  Background:
    * url url_booking


  @HappyPath
  Scenario: Get All Bookings Successful
    Given path 'booking'

    When method GET

    Then status 200
    And match response[0].bookingid == "#number"
    And match response[0].bookingid == "#notnull"


  @ScenarioAltern
  Scenario: Get Booking by id Successful
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@HappyPath')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid
    And header Accept = 'application/json'

    When method GET

    Then status 200
    And match response == read("classpath:bookings/getBookings/ResponseBodyGetBooking.json")
    And match response == read("classpath:bookings/getBookings/ResponseSchemaGetBooking.json")


  @ScenarioAltern
  Scenario: Get Booking by non-existent id
    Given def bookingid = 999999
    And path 'booking/' + bookingid
    And header Accept = 'application/json'

    When method GET

    # Devuelve codigo 404 Not Found
    Then status 404

  @ScenarioOutline
  Scenario Outline: Get Booking by id with different test cases
    Given def bookingid = <bookingid>
    And path 'booking/' + bookingid
    And header Accept = 'application/json'

    When method GET

    Then status <statusCode>

  Examples:
    | bookingid | statusCode |
    | -3        | 404        |
    | "m"       | 404        |