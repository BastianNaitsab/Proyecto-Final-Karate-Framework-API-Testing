Feature: Tests for create bookings

  Background:
    * url url_booking
    * header Accept = 'application/json'

  @HappyPath
  Scenario: Create Booking Successful
    Given path 'booking'
    And def requestBodyJson = read('classpath:bookings/createBookings/RequestBodyCreateBooking.json')
    And request requestBodyJson

    When method POST

    Then status 200
    And match response == read('classpath:bookings/createBookings/ResponseBodyCreateBooking.json')
    And match response == read('classpath:bookings/createBookings/ResponseSchemaCreateBooking.json')
    And assert responseTime > 200

  @ScenarioAltern
  Scenario: Create Booking with BodyRequest incorrect
    Given path "booking"
    And request
    """
    {
      "firstname" : 123,
      "totalprice" : "123"
    }
    """

    When method POST

    Then status 500
    And  match response == "Internal Server Error"

  # fechas de check-in posteriores a las de check-out
  @ScenarioAltern
  Scenario: Create Booking with invalid check-in and check-out dates
    Given path 'booking'
    And def requestBodyJson = read('classpath:bookings/createBookings/InvalidRequestBodyCreateBooking.json')
    And request requestBodyJson

    When method POST

    # el status que deberia devolver seria un 400 Bad Request pero devuelve un 200 OK
    Then status 200
