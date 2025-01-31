package bookings.deleteBookings;

import com.intuit.karate.junit5.Karate;

public class DeleteBookingRunner {
    @Karate.Test
    Karate testDeleteBooking(){
        return Karate.run("classpath:bookings/deleteBookings/deleteBooking.feature");
    }
}
