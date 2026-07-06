<?php

$conexion = new mysqli(
    getenv('MYSQLHOST'),
    getenv('MYSQLUSER'),
    getenv('MYSQLPASSWORD'),
    getenv('MYSQLDATABASE'),
    (int)getenv('MYSQLPORT')
);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

?>