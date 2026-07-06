<?php

include 'conexion.php';

$id = $_POST['id'];

$sql = "DELETE FROM usuarios WHERE id='$id'";

$conexion->query($sql);

echo "Registro eliminado";

?>