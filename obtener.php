<?php

include 'conexion.php';

$sql = "SELECT * FROM usuarios";
$resultado = $conexion->query($sql);

$datos = array();

while($fila = $resultado->fetch_assoc()){
    $datos[] = $fila;
}

echo json_encode($datos);

?>