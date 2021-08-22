<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<div class="container" >
<h3>Consulta Boleta </h3>

	<form id="id_form"> 
		<div class="row">
			<div class="col-md-6">		
				<div class="form-group">
					<select id="id_cliente" name="idCliente" class='form-control'>
						<option value="-1">[Todos]</option>    
					</select>
			    </div>
		 	</div>
		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<button id="id_filtrar"   type="button" class="btn btn-primary" >Filtrar</button>
		 		</div>
		 	</div>
		 </div>   
		 <div class="row">
		 	<div class="col-md-12">
				<div class="content" >
						<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 10%">ID</th>
												<th style="width: 40%">Cliente</th>
												<th style="width: 25%">Usuario</th>
												<th style="width: 15%">Fecha registro</th>
												<th style="width: 10%">Ver Detalle</th>
											</tr>
										</thead>
										<tbody>
												   

										</tbody>
							</table>	
					</div>	
				</div>
		 </div>
		    
	</form>
	
		<!-- Modal Mensaje -->	
		  <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 20px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
				</div>
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
					
			    </div>
			</div>
			</div>
		</div>
		
	
</div>

<script type="text/javascript">

	$.getJSON("listaCliente",{}, function(data){ 
		$.each(data, function(i, obj){
			$("#id_cliente").append("<option value='"+ obj.idCliente +"'>"+ obj.apellidoNombre +"</option>"); 
		});
	});	

	$("#id_filtrar").click(function(){
		var var_cliente = $("#id_cliente").val();
		$.getJSON("listaBoleta",{"idCliente":var_cliente}, function(data){ 
			agregarGrilla(data);
		});	
			
	});

	function agregarGrilla(lista){
		 $('#id_table').DataTable().clear();
		 $('#id_table').DataTable().destroy();
		 $('#id_table').DataTable({
				data: lista,
				searching: false,
				ordering: true,
				processing: true,
				pageLength: 5,
				lengthChange: false,
				columns:[
					{data: "idBoleta"},
					{data: "cliente.apellidoNombre"},
					{data: "usuario.nombre"},
					{data: "fecha"},
					{data: function(row, type, val, meta){
					    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="verDetalle(\'' + row.idBoleta + '\')">Detalle</button>';
						return salida;
					},className:'text-center'},			
				]                                     
		    });
	}

	function verDetalle(idBoleta){
		$.getJSON("verDetalles",{"idBoleta":idBoleta}, function(data){ 
			$("#idMensajeTexto").html(data.texto);
			$("#idMensaje").modal("show");
		});	
		
	}
	
</script>

</body>
</html>



