<?php

include 'conexion.php';

$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$ciudad = $_POST['ciudad'];

$sql = "INSERT INTO usuarios(nombre, correo, ciudad)
VALUES('$nombre','$correo','$ciudad')";

$conexion->query($sql);

echo "Registro agregado";

?>