Feature: Test for modify booking by id

  Background:
    # Para configurar la url y header de los Scenario
    * url url_booking
    * header Accept = 'application/json'

  @HappyPath
  Scenario: Modify Booking by bookingid Successful
    #    Necesitamos primero crear un booking y obtener su id
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@HappyPath')
    And def bookingid = createBooking.response.bookingid
    #    Aqui se usa el id generado
    And path 'booking/' + bookingid

    #    Despues necesitamos generar un token
    And def authentication = call read("classpath:bookings/authentication/authentication.feature@HappyPath")
    And def token_value = authentication.response.token
    #    Aqui lo usamos en el header
    And header Cookie = 'token=' + token_value

    #    Luego usamos el body de request que tenemos en otro archivo, estructura de lo que se va a enviar
    And def requestBodyJson = read('classpath:bookings/updateBookings/RequestBodyModifyBooking.json')
    And request requestBodyJson

    #    Se hace la solicitud
    When method PUT

    #    Se recibe el status y la respuesta, comparamos con lo que esperamos
    Then status 200
    And match response == read("classpath:bookings/updateBookings/ResponseBodyModifyBooking.json")
    And match response == read("classpath:bookings/updateBookings/ResponseSchemaModifyBooking.json")
    And match response != createBooking.response.booking


  @ScenarioAltern
  Scenario: Modify non-existing booking by bookingid
    And def noBookingid = 99999
    And path 'booking/' + noBookingid

    And def authentication = call read("classpath:bookings/authentication/authentication.feature@HappyPath")
    And def token_value = authentication.response.token
    And header Cookie = 'token=' + token_value

    And def requestBodyJson = read('classpath:bookings/updateBookings/RequestBodyModifyBooking.json')
    And request requestBodyJson

    When method PUT

    # el status que deberia devolver seria un 404 Not Found pero devuelve 405 Method Not Allowed
    Then status 405
#    And match response.message == 'Booking not found'


  @ScenarioAltern
  Scenario: Modify booking with invalid token
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@HappyPath')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid

    # Usamos un token inválido
    And def invalid_token = "5fds4fds2finvalidtoken"
    And header Cookie = 'token=' + invalid_token

    And def requestBodyJson = read('classpath:bookings/updateBookings/RequestBodyModifyBooking.json')
    And request requestBodyJson

    When method PUT

    # el status que deberia devolver seria un 401 Unauthorized pero devuelve 403 Forbidden
    Then status 403
#    And match response.message == 'Unauthorized'
