<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/bandeja.css">
	<title>SEGUNDO EXAMEN</title>
</head>
<body>
	<head class="encabezado">
        <h1 class="h1">SEGUIMIENTO DE POSTULACION AL CENTRO DE ESTUDIANTES CEI</h1>
    </head>
	<section>
	<?php
	session_start();
	include "conexion.inc.php";
	$sql="select * from seguimiento where postulante='".$_SESSION["postulante"]."' ";
	//$sql="select * from seguimiento where fechafin is not null";
	$sql.="and fechafin is not null";
	$resultado=mysqli_query($conn, $sql);
	?>
	<table>
	<tr>
		<td>Tramite</td>
		<td>Flujo</td>
		<td>Proceso</td>
		<td>Fecha Inicio</td>
		<td>Accion</td>
	</tr>
	<?php
	while($fila=mysqli_fetch_array($resultado))
	{
		echo "<tr>";
		echo "<td>".$fila["notramite"]."</td>";
		echo "<td>".$fila["flujo"]."</td>";
		echo "<td>".$fila["proceso"]."</td>";
		echo "<td>".$fila["fechainicio"]."</td>";
		echo "<td><a ";
		echo "href='desflujo.php?flujo=$fila[flujo]&proceso=$fila[proceso]'";
		echo ">Mostrar<a/></td>";
		echo "</tr>";
	}
	?>
	</table>
	</section>
</body>
</html>

