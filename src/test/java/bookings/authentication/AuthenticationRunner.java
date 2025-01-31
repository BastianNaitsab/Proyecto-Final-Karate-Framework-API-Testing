package bookings.authentication;

import com.intuit.karate.junit5.Karate;

public class AuthenticationRunner {
    @Karate.Test
    Karate testAuthentication() {
        return Karate.run("classpath:bookings/authentication/authentication.feature");
    }
}
