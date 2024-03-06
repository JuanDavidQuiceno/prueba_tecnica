# prueba_tecnica

## Requisitos

- Flutter versión 3.19.0

## Configuración

1. Creación de variables de entorno:

   - A nivel de la raíz del proyecto, crear un archivo `api-key-local.json` y agregar tus claves de API.
   - Cree los archivos necesarios para los diferentes entornos (desarrollo, producción, etc.) y modifique el archivo `launch.json` de Visual Studio Code para que apunte al archivo correspondiente.

2. Configuración de Visual Studio Code (VSCode):
   - Verifica si existe un directorio `.vscode` en la raíz del proyecto. Si no existe, créalo.
   - Dentro del directorio `.vscode`, crea o edita el archivo `launch.json` y añade lo siguiente:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "prueba_tecnica",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_development.dart",
      "args": ["--dart-define-from-file", "api-key-local.json"]
    }
  ]
}
```
