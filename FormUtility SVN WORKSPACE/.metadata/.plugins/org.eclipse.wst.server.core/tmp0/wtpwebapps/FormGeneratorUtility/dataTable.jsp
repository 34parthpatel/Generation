<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css">
<link rel="stylesheet" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css"> -->
<link rel="stylesheet" href="datatable/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="datatable/css/editor.dataTables.min.css">
<link rel="stylesheet" href="datatable/css/jquery-ui.css">
<link rel="stylesheet" href="datatable/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="datatable/css/select.dataTables.min.css">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script> -->
<!-- <script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script> -->
<script src="datatable/js/jquery-1.12.4.js"></script>
<script src="datatable/js/jquery-ui.js"></script>
<script src="datatable/js/jquery.dataTables.min.js"></script>
<script src="datatable/js/dataTables.buttons.min.js"></script>
<script src="datatable/js/dataTables.select.min.js"></script>

<script src="jquery-validate/jquery.validate.js"></script>
<script src="jquery-validate/jquery.validate.min.js"></script>
<script src="jquery-validate/additional-methods.js"></script>
<script src="jquery-validate/additional-methods.min.js"></script>


<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <script src="js/jquery-3.2.1.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function() {
    /* editor = new $.fn.dataTable.Editor( {
        ajax: 'dataTable',
        table: '#example',
        fields: [ {
                label: 'First name:',
                name:  'first_name'
            }, {
                label: 'Last name:',
                name:  'last_name'
            }, {
                label: 'Updated date:',
                name:  'updated_date',
                type:  'date'
            }, {
                label: 'Registered date:',
                name:  'registered_date',
                type:  'date'
            }
        ]
    } ); */
 	
    
	
	var oTable = $('#example1').dataTable({
			"columns" : [ {"data" : "id"}, 
			              {"data" : "num"}, 
			              {"data" : "code"} ],
			"processing" : true,
			"serverSide" : true,
			"paging" : true,
			"ajax" : {
				"contentType" : "application/json",
				"data" : function(d) {
					return JSON.stringify(d);
				},
				"url" : "jsonUsingRest",
				"dataSrc" : "demo",
				"type" : "POST"
			}
		});

		var localVoucherTable = $("#example").dataTable({
			"serverSide" : true,
			"processing" : true,
			"ordering" : false,
			"paging" : true,
			"ajax" : {
				"url" : "dataTable"
			}
		});

		/* $('#example').DataTable( {
		    dom: 'Bfrtip',
		    ajax: 'dataTable',
		    columns: [
		        { data: 'first_name' },
		        { data: 'last_name' },
		        { data: 'updated_date' },
		        { data: 'registered_date' }
		    ],
		    select: true
		} ); */
	});
</script>
<script type="text/javascript">
 
	$(function() {
		$('#dialog').dialog({
			autoOpen : false,
			buttons : {
				'Send' : function() {
					if ($('#form').valid()) {
						var data = JSON.stringify( $("#form").serializeArray() );
						console.log( data );
						alert('Success ' + data);
						$('#dialog').dialog('close');
					}
				}
			}
		});
		$('#open').on('click', function() {
			$("#form").css("display","");
			$('#dialog').dialog('open');
		});
		$('#set').on('click', function() {
			$("#form").css("display","");
			var data = "[{\"name\":\"fname\",\"value\":\"asd\"},{\"name\":\"lname\",\"value\":\"asd\"},{\"name\":\"age\",\"value\":\"132\"}]";
			console.log( data );
			var JsonObject= JSON.parse(data);
			$.each(JsonObject, function(key, value) {
				console.log(value);
				$("#"+value.name).val(value.value);
			});
			$('#dialog').dialog('open');
		});
		$('#set1').on('click', function() {
			$("#form").css("display","");
			console.log($("#set1").val());
			$('#dialog').dialog('open');
		});
		$('#form').validate({
			rules : {
				fname : "required",
				lname : "required",
				age : {
					required : true,
					digits : true,
					maxlength : 9,
					min : 1
				}
			}
		});
	});
	
	 
</script>
<script type="text/javascript">
function myfuncion(val1)
{
	console.log(val1);
}
</script>
</head>
<body>
	<input id="open" type="button" value="Add" />
	<input id="set" type="button" value="Set" />
	
	<table id="example" class="stripe row-border order-column" cellspacing="0" width="100%" >
        <thead>
            <tr>
                <th>First name</th>
                <th>Last name</th>
                <th>Updated date</th>
                <th>Registered date</th>
                <th>Edit/Delete</th>
            </tr>
        </thead>
    </table>
    <div id="dynamic">
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="example1">
			<thead>
				<tr>
					<!-- <th width="10%">ID</th>
					<th width="10%">fgh</th> -->
					<th width="10%">ID</th>
					<th width="10%">Num</th>
					<th width="10%">Code</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dialog">
		<form id="form" style="display: none">
			<table>
				<tr>
					<td>First Name : <input type="text" name="fname" id="fname" /></td>
				</tr>
				<tr>
					<td>Last Name : <input type="text" name="lname" id="lname" /></td>
				</tr>
				<tr>
					<td>Age : <input type="text" name="age" id="age" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
/* var oTable = $('#example1').dataTable({
	"columns" : [ {"data" : "id"},
	              {"data" : "fghfgh"}],
	"processing" : true,
	"serverSide" : true,
	//"paging": true,
	"ajax" : {
		 "contentType": "application/json",
        "data": function ( d ) {
                  return JSON.stringify( d );
           },
		"url" : "listForDatatable/ghfgh",
		"dataSrc" : "data",
		"type" : "POST"
	}
}); */
</script>
</html>