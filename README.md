# Calendario_escolar

Este proyecto consta de 

## Getting Started

presentacion con links a youtube y github

poner backend

## Instalación

1. Descargar repositorio de GitHub en un directorio local deseado
2. Ejecutar el comando en flutter para instalar los paquetes necesarios
    ```sh
    flutter pub get
    ```
3. Base de datos en [ElephantSQL](https://customer.elephantsql.com/instance)
   1. Entrar a la plataforma y crear una nueva instancia para almacenar la base de datos
   2. Guardar los datos de la pestaña "detalles" (details) para la conexión posterior con Glitch
   3. Colocar datos iniciales (para comprobar que funcionan al usar la aplicación)
      - NOTA: solo contiene una tabla llamada "homeworks"
      - Como datos iniciales se recomienda usar el documento [inicial_create_and_insert.sql](./backend/elephantSQL/inicial_create_and_insert.sql) dentro del directorio backend, con este archivo igualmente se puede entender la estructura de la base de datos
4. creación de un proyecto en [Glitch](https://glitch.com/dashboard) para acceder a la base de datos
   1. Entrar a la plataforma para crear un nuevo proyecto
   2. Una vez creado el proyecto crear los 2 archivos principales en la raíz de este
      - Los archivos se pueden obtener del directorio [glitch](backend/glitch/) dentro del directorio backend
      - NOTA: el archivo [db.js](backend/glitch/db.js) debe ser llenado con la información obtenida del paso 3.2

Una vez ejecutados estos pasos se podrá hacer la ejecución del proyecto:

## Licencia

MIT

## Ejemplo de ejecucipon del proyecto

<iframe
    width="640"
    height="480"
    src="https://youtu.be/hTEJmWsTA-Y"
    frameborder="0"
    allow="autoplay; encrypted-media"
    allowfullscreen
>
</iframe>