# DAMM_TPE

![SerManos Logo](/assets/images/logo_with_text.png)

TPE 73.21 - Desarrollo de Aplicaciones Móviles Multiplataforma Segundo Cuatrimestre 2023.

## Autores

- [Matías Lombardi](https://github.com/matiaslombardi)
- [Gian Luca Pecile](https://github.com/glpecile)
- [Ana Tarantino](https://github.com/anatarantino)

## Objetivo

Desarrollar una aplicación móvil multiplataforma utilizando Flutter que permita a los usuarios buscar oportunidades de voluntariado cercanas a su ubicación y apuntarse a ellas.

Como funcionalidad adicional se implementó pull to refresh en las vistas de voluntariados, dentro de un voluntariado y dentro de la vista de noticias para actualizar su contenido.

## Stack Tecnológico

### Frontend

- Flutter
- Riverpod
- go_router

### Backend

- Firebase
  - Database
  - Storage
  - Authentication
  - Analytics

## Ejecución

Para tener el código generado por el generador de código de riverpod, ejecutar el siguiente comando:

```shell
flutter pub run build_runner watch -d
```

con este comando serán generados los archivos `*.g.dart` necesarios en la carpeta `/lib/providers`.

Luego correr la aplicación en su dispositivo deseado.

## Testing

Para ejecutar los tests, ejecutar el siguiente comando:

```shell
flutter test
```
