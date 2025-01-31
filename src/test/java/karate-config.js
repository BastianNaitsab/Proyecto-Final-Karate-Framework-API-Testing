function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {
      // Aca se declaran variables globales
    env: env,
    url_booking: 'https://restful-booker.herokuapp.com'
  }

  // Aca es para cambiar la configuracion dependiendo el ambiente en el que se usara
  if (env == 'dev') {
    // Para ambiente de desarrollo "dev"
    config.url_booking = 'https://restful-booker-dev.herokuapp.com'
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'qa') {
    // Para ambiente de pruebas "qa"
    config.url_booking = 'https://restful-booker.herokuapp.com'
    // customize
  }

  //  Para configurar cosas generales del proyecto, como la url, timeout, etc
  karate.configure("url", "https://restful-booker.herokuapp.com")
  karate.configure("logPrettyRequest", true)

  //  karate.configure("connectTimeout", 10000)
  return config;
}

