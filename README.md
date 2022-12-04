# Calendario_escolar

Este proyecto consta de una aplicación funcional para Android y iOS para estudiantes la cual puede funcionar como un horario que lista las materias que actualmente se están llevando. Igualmente se permite crear una materia de forma directa desde la aplicación y finalmente existe igual una sección de contacto en la que se puede colocar un número para realizar una llamada, enviar un mensaje por Whatsapp o visitar en la aplicación de Youtube el canal del creador.

## Lenguajes y plataformas utilizados

- ### [Flutter][flutter] (Dart)
- ### [ElephantSQL][elephant] (SQL)
- ### [Glitch][glitch] (NodeJS)

## Instalación

1. Descargar repositorio de GitHub en un directorio local deseado

   NOTA: si el proyecto desea personalizarse es necesario crear uno nuevo y copiar los archivos para poder hacer una conexión a un nuevo proyecto de [Firebase][firebase] con una authenticación personal, ya que el actual proyecto es propiedad de [Francisco Gutiérrez López](https://github.com/FrancoGL20)
2. Ejecutar el comando en flutter para instalar los paquetes necesarios
    ```sh
    flutter pub get
    ```
3. Base de datos en [ElephantSQL][elephant]
   1. Entrar a la plataforma y crear una nueva instancia para almacenar la base de datos
   2. Guardar los datos de la pestaña "detalles" (details) para la conexión posterior con Glitch
   3. Colocar datos iniciales (para comprobar que funcionan al usar la aplicación)
      - NOTA: solo contiene una tabla llamada "homeworks"
      - Como datos iniciales se recomienda usar el documento [inicial_create_and_insert.sql](./backend/elephantSQL/inicial_create_and_insert.sql) dentro del directorio backend, con este archivo igualmente se puede entender la estructura de la base de datos
4. creación de un proyecto en [Glitch][glitch] para acceder a la base de datos
   1. Entrar a la plataforma para crear un nuevo proyecto
   2. Una vez creado el proyecto crear los 2 archivos principales en la raíz de este
      - Los archivos se pueden obtener del directorio [glitch](backend/glitch/) dentro del directorio backend
      - NOTA: el archivo [db.js](backend/glitch/db.js) debe ser llenado con la información obtenida del paso 3.2

Una vez ejecutados estos pasos se podrá hacer la ejecución del proyecto. ejemplo en [siguiente sección](#ejemplo-de-ejecución-del-proyecto):

## Ejemplo de ejecución del proyecto

### [Ver video en Youtube](https://youtu.be/hTEJmWsTA-Y)


## Licencia

MIT


[flutter]:<https://flutter.dev/>
[elephant]:<https://customer.elephantsql.com/instance>
[glitch]:<https://glitch.com/dashboard>
[firebase]:<https://console.firebase.google.com/>
