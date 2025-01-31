# 🚀 Proyecto Final: Karate Framework API Testing

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📚 Descripción

Este proyecto tiene como objetivo demostrar el uso del **Karate Framework** para realizar pruebas automatizadas en la API Restful Booker. El proyecto cubre una serie de escenarios para verificar el correcto funcionamiento de los endpoints de la API, incluyendo pruebas de autenticación, creación, modificación, eliminación y obtención de reservas.

## 🧰 API Utilizada

- **Base URL:** https://restful-booker.herokuapp.com/
- **API:** RestfulBooker

## 📖 Características del Proyecto

### Escenarios de Prueba Implementados:

1. Autenticación:
   - Creación de token con credenciales válidas e inválidas.
   - Escenarios de prueba con credenciales repetidas.
   - Uso de "Scenario Outline" para múltiples credenciales.

2. Creación de Reservas:
   - Creación de reservas con datos válidos.
   - Pruebas con datos inválidos en el cuerpo de la solicitud, como fechas erróneas y tipos de datos incorrectos.

3. Eliminación de Reservas:
   - Eliminación de reservas por ID.
   - Verificación de la eliminación con solicitudes GET posteriores.
   - Pruebas de eliminación sin token.

4. Obtención de Reservas:
   - Obtención de todas las reservas.
   - Obtención de reservas por ID, tanto válidas como no existentes.

5. Modificación de Reservas:
   - Modificación de reservas existentes.
   - Pruebas con tokens inválidos y reservas no existentes.

## 🛠️ Herramientas y Configuración:

1. **Karate Framework** para la automatización de las pruebas.
2. **JUnit** para ejecutar las pruebas en paralelo y generar reportes.
3. **Cucumber JSON Reports** para la visualización detallada de los resultados.
4. **Logback** para la configuración de logs.
5. **Git** para control de versiones y gestión del código.

## 🚀 Cómo Ejecutar el Proyecto

1. Clona el repositorio:

```bash
git clone https://github.com/BastianNaitsab/Proyecto-Final-Karate-Framework-API-Testing
```

2. Navega al directorio:

```bash
cd Proyecto-Final-Karate-Framework-API-Testing
```

3. Instala las dependencias con Maven:

```bash
mvn clean install
```

4. Ejecuta las pruebas en paralelo:

```bash
mvn clean test
```

5. Genera los reportes de Cucumber:

Los reportes de Cucumber se generarán automáticamente después de la ejecución de las pruebas. Puedes encontrar los reportes en el directorio `target/cucumber-html-reports`.

