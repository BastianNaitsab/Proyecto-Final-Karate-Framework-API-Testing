Feature: Test for delete booking by id

  Background:
    # Para configurar la url y header de los Scenario
    * url url_booking
    * header Accept = 'application/json'


  @HappyPath
    Scenario: Delete Booking by bookingid Successful
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@HappyPath')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid

    And def authentication = call read("classpath:bookings/authentication/authentication.feature@HappyPath")
    And def token_value = authentication.response.token
    And header Cookie = 'token=' + token_value

    When method DELETE

    # el api deberia devolver un status 200 en vez de 201
    Then status 201


  @ScenarioAltern
  Scenario: Delete Booking by bookingid and verify it is deleted
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@HappyPath')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid

    And def authentication = call read("classpath:bookings/authentication/authentication.feature@HappyPath")
    And def token_value = authentication.response.token
    And header Cookie = 'token=' + token_value

    When method DELETE

    Then status 201

    # Hacer GET para verificar que la reserva ha sido eliminada
    And path 'booking/' + bookingid
    When method GET
    # Devuelve codigo 404 Not Found
    Then status 404
    And print response


  @ScenarioAltern
  Scenario: Delete Booking by bookingid without token_value
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@HappyPath')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid

    When method DELETE

    # Devuelve codigo 403 Forbidden
    Then status 403
    And print response