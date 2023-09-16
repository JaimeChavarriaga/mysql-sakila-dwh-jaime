# Sakila: Bodega de datos basada de ejemplo en MySQL

> Bodega de datos de ejemplo que representa una tienda para el alquiler de DVD.

La documentación de este ejempo está disponible en [el sitio de MySQL](https://dev.mysql.com/doc/sakila/en/sakila-introduction.html) y en el [repositorio de Github](https://github.com/datacharmer/test_db).


## Ejecutar los contenedores

La definición de los contenedores está en el archivo `docker-compose.yml`. Se puede ejecutar usando `docker compose up`

```
docker compose up
```

En Visual Studio Code o en Gitpod es posible hacer clic derecho y ejecutar la opción `Compose Up`

## Servicios disponibles

| Contenedor   | Puerto    | Descripción                        |
|--------------|-----------|------------------------------------|
| mysql-sakila | 3306      | MySQL con las bases de datos       | 
| phpmyadmin   | 8081      | Administración de la base de datos |
| keetle       | 8080      | Sistema de ETL                     |


## Acceder a la base de datos

> El script expone los puertos 3306 y 33060. Cuando ejecuta el contenedor es posible conectarse a la base de datos usando cualquier programa, incluyendo [MySQL Workbench](https://www.mysql.com/products/workbench/), usando la dirección `localhost` en el puerto 3306.

Es posible usar el script `ejecutar-mysql` para conectarse a la base de datos.

```
# En Windows
ejecutar-mysql.bat

# En linux
sh ./ejecutar-mysql.sh
```

La contraseña para el usuario `root` es `secret`.

## Detener y eliminar el contenedor

Es posible usar `docker compose down` para detener y eliminar los contenedores.

```
docker compose down
```

En Gitpod y Visual Studio Code es posible hacer clic derecho sobre el archivo `docker-compose.yml` y ejecutar la opción `Compose Down`
