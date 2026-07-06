<?php

$conexion = new mysqli(
    "localhost",
    "root",
    "",
    "escuela"
);

if($conexion->connect_error){
    die("Error de conexión");
}

?>