# Trabajo práctico especial: Desarrollo de una app en Flutter

![SerManos Logo](/assets/images/logo_with_text.png)

TPE 73.21 - Desarrollo de Aplicaciones Móviles Multiplataforma Segundo Cuatrimestre 2023.

## Autores

- [Matías Lombardi](https://github.com/matiaslombardi)
- [Gian Luca Pecile](https://github.com/glpecile)
- [Ana Tarantino](https://github.com/anatarantino)

## Objetivo

Desarrollar una aplicación móvil multiplataforma utilizando Flutter que permita a los usuarios
buscar oportunidades de voluntariado cercanas a su ubicación y apuntarse a ellas.

Como funcionalidad adicional se implementó pull to refresh en las vistas de voluntariados, dentro de
un voluntariado y dentro de la vista de noticias para actualizar su contenido.

## Stack Tecnológico

### Frontend

- Flutter
- Riverpod
- go_router

### Backend

Para el backend se hace uso de Firebase, utilizando los siguientes servicios:

- Database
- Storage
- Authentication
- Analytics
- Crashlytics

## Monitoreo y Eventos

Se hace tracking con firebase analytics de los siguientes eventos:

- login del usuario
- aplicar a voluntariado
- dejar voluntariado

## Ejecución

Para tener el código generado por el generador de código de riverpod, ejecutar el siguiente comando:

```shell
flutter pub run build_runner watch -d
```

con este comando serán generados los archivos `*.g.dart` necesarios en la carpeta `/lib/providers`.

Luego correr la aplicación en su dispositivo deseado.

En caso de ejecutar la aplicación en android, se debe agregar primero `google-services.json` en la
carpeta `/android/app/` para que la aplicación pueda conectarse a Firebase.

```json
{
  "project_info": {
    "project_number": "666241362205",
    "project_id": "sermanos-91896",
    "storage_bucket": "sermanos-91896.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:666241362205:android:5cd99cac2d2fb9d9c859f4",
        "android_client_info": {
          "package_name": "com.example.fluttertest"
        }
      },
      "oauth_client": [],
      "api_key": [
        {
          "current_key": *******
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": []
        }
      }
    }
  ],
  "configuration_version": "1"
}
```

En caso de ejecutar la aplicación en iOS, se debe agregar primero `GoogleService-Info.plist` en la
carpeta `/ios/Runner/` para que la aplicación pueda conectarse a Firebase.

```xml
<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>API_KEY</key>
        <string>*******</string>
        <key>GCM_SENDER_ID</key>
        <string>666241362205</string>
        <key>PLIST_VERSION</key>
        <string>1</string>
        <key>BUNDLE_ID</key>
        <string>com.example.fluttertest</string>
        <key>PROJECT_ID</key>
        <string>sermanos-91896</string>
        <key>STORAGE_BUCKET</key>
        <string>sermanos-91896.appspot.com</string>
        <key>IS_ADS_ENABLED</key>
        <false></false>
        <key>IS_ANALYTICS_ENABLED</key>
        <false></false>
        <key>IS_APPINVITE_ENABLED</key>
        <true></true>
        <key>IS_GCM_ENABLED</key>
        <true></true>
        <key>IS_SIGNIN_ENABLED</key>
        <true></true>
        <key>GOOGLE_APP_ID</key>
        <string>1:666241362205:ios:b8d435e304747628c859f4</string>
    </dict>
</plist>
```

## Testing

Para ejecutar los tests unitarios, ejecutar el siguiente comando:

```shell
flutter test
```
