package bookings.updateBookings;

import com.intuit.karate.junit5.Karate;

public class ModifyBookingRunner {
    @Karate.Test
    Karate testModifyBooking(){

        return Karate.run("classpath:bookings/updateBookings/modifyBooking.feature");
    }
}
