<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>AuditReport</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<link rel="stylesheet" href="../css/forms.css">
<!-- <script src="../js/jquery-3.2.1.min.js"></script> -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
<script src="../js/formutility.js"></script>
<script src="../js/custom_alert.js"></script>
<script src="../js/bootstrap-show-password.min.js"></script>
<script src="../js/js-form-validator.min.js"></script>
<script src="../js/jquery.serializejson.js"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
		$('body').tooltip({
			selector : '[rel=tooltip]'
		});
	});
</script>
<style type="text/css">
label[id*="-error"] {
	color: red;
}
</style>
</head>
<body>
	<a href='../index' class='glyphicon glyphicon-home btn-lg'
		style='text-decoration: none; margin: 10px 20px; color: black;'></a>
	<a class='glyphicon glyphicon-question-sign btn-lg' href='#'
		title='Help' data-toggle='popover' data-placement='left'
		data-trigger='focus' data-content='Audit Report'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>AuditReport</h2>
		</center>
		<form action="../insertForm/AuditReport" id="idAuditReport"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-4">Action</label>
				<div class="col-sm-5">
					<select class="form-control" name="action" id="action" tabindex="1"
						title="Enter Action" rel="tooltip" data-toggle="tooltip"
						data-placement="right"><option value='' selected>Please	select</option>
						<option value='Saved'>Insert</option>
						<option value='Updated'>Update</option>
						<option value='Deleted'>Delete</option>
						<option value='drop'>Drop</option></select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">From Date</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="fromdate"
						id="fromdate" tabindex="2" onkeypress="return false;" readonly
						title="Enter From Date" rel="tooltip" data-toggle="tooltip"
						data-placement="right" data-rule="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">To date</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="todate" id="todate"
						tabindex="3" onkeypress="return false;" readonly
						title="Enter To Date" rel="tooltip" data-toggle="tooltip"
						data-placement="right" data-rule="" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type='button' class='btn Info'
						id='search' onclick='loadDataTable()' value='Search' />
				</div>
			</div>
		</form>
		<font color='red'><p id="errMessage"></p></font>
		<c:if test="${not empty message}">
			<font color='green'><c:out value="${message }"></c:out></font>
		</c:if>
		<c:if test="${not empty errMessage}">
			<font color='red'> ${errMessage } </font>
		</c:if>
		<table class="table" id="myTable">
			<thead>
				<tr>
					<th>Action</th>
					<th>Audit Date</th>
					<th>TableName</th>
					<th>Data</th>
				</tr>
			</thead>
			<tbody id="myTableBody">
			
			</tbody>
			<tfoot>
				<th>Action</th>
				<th>Audit Date</th>
				<th>TableName</th>
				<th>Data</th>
			</tfoot>
		</table>
	</div>
	
</body>
<script src="../js/formutility_date.js"></script>
<script>
	var returnType = true;
	var errMessage = "";
	$(function() {
		$('#submitAuditReport').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return returnType;
		});
	});
	function checkFile(id) {
		checkFileType(id);
	}
</script>
<script>
	new Validator(document.querySelector('#idAuditReport'), function(err, res) {
		return res;
	}, options = {
		rules : {},
		messages : {
			en : {}
		}
	});
</script>
<script>
	$('#fromdate').datetimepicker({
		maxDate : '+1970/01/01',
		timepicker : true,
		format : 'Y-m-d H:i',
		formatDate : 'Y-m-d H:i',
		step : 1,
	});
	$('#todate').datetimepicker({
		maxDate : '+1970/01/01',
		timepicker : true,
		format : 'Y-m-d H:i',
		formatDate : 'Y-m-d H:i',
		step : 1,
	});
</script>
<script>
function loadAudit(){
	//alert("audti");
	$.ajax({
		type : "POST",
		url : "../audtiRerportRest",
		data : $("#idAuditReport").serialize(),
		success : function(result) {
			//alert(result);
			$('#myTableBody').html(result);
			//$('#myTable').append(result);
		},
		error : function(
				XMLHttpRequest,
				textStatus,
				errorThrown) {
			document.getElementById("errMessage").innerHTML = "<font color='red'>Record retrieve failed.</font>";
		}
	});	
}

</script>
<script>
	var oTable = $('#myTable').dataTable({
		"order": [[ 1, "desc" ]],
		"columns" : [ {
			"data" : "action"
		}, {
			"data" : "createdDate"
		}, {
			"data" : "entityName"
		}, {
			"data" : "detail"
		}, ],
		"columnDefs" : [ {
			orderable : false,
			targets : [ -1]
		} ],
		"processing" : true,
		"serverSide" : false,
		"paging" : true,
	});
</script>
<script>

function loadDataTable() {
	
	var fromDate=new Date($('#fromdate').val());
	var toDate=new Date($('#todate').val());
	if(fromDate>toDate){
		//document.getElementById("errMessage").innerHTML = "<font color='red'>Record retrieve failed.</font>";
		$("#errMessage").html("<font color='red'>To cannot be less than From.</font>");
		return false;
	}
	$("#errMessage").html("");
	if ($.fn.DataTable.isDataTable('#myTable')) {
		$('#myTable').DataTable().clear().destroy();
	}
	var oTable = $('#myTable').dataTable({
		"order": [[ 1, "desc" ]],
		"columns" : [ {
			"data" : "action"
		}, {
			"data" : "createdDate"
		}, {
			"data" : "entityName"
		}, {
			"data" : "detail"
		}, ],
		"columnDefs" : [ {
			orderable : false,
			targets : [ -1 ]
		} ],
		"processing" : true,
		"serverSide" : true,
		"paging" : true,
		"ajax" : {
			"contentType" : "application/json",
			"data" : function(d) {
				d.formData = $('#idAuditReport').serializeArray();
				return JSON.stringify(d);
			},
			"url" : "../audtiRerportRest",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
	$('#myTable_filter input').unbind();
	$('#myTable_filter input').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			oTable.fnFilter(this.value);
		} else if (!this.value.trim()) {
			oTable.fnFilter(this.value);
		}
	});
	$('#myTable tfoot th')
			.each(
					function() {
						var title = $(this).text();
						if (!(title.toUpperCase() == ('data').toUpperCase())) {
							$(this)
									.html(
											'<input type="text" placeholder="Search '+title+'" />');
						}
					});
	oTable.api().columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change', function(e) {
			if (e.keyCode == 13) {
				that.search(this.value).draw();
			} else if (!this.value.trim()) { /*fire when search box gets empty */
				that.search(this.value).draw();
			}
		});
	});
}
</script>
</html>
