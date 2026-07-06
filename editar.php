<?php

include 'conexion.php';

$id = $_POST['id'];
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$ciudad = $_POST['ciudad'];

$sql = "UPDATE usuarios
SET nombre='$nombre',
correo='$correo',
ciudad='$ciudad'
WHERE id='$id'";

$conexion->query($sql);

echo "Registro actualizado";

?>