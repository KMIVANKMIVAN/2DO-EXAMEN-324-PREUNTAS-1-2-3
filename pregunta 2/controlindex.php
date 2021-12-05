<?php
include "conexion.inc.php";
$postulante=$_GET["postulante"];
$contrasenia=$_GET["contrasenia"];
$sql="select * from postulante where postulante='".$postulante;
$sql.="' and contrasenia='".$contrasenia."'";
$resultado=mysqli_query($conn, $sql);
$fila=mysqli_fetch_array($resultado);
if ($fila["postulante"]==$postulante and $fila["contrasenia"]==$contrasenia)
{
	session_start();
	$_SESSION["postulante"]=$postulante;
	header("Location: bandeja.php");
}
else
{
	header("Location: index.php");
}
?>
