<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>demo3</title>
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
</head>
<body>
	<a href='../index' class='glyphicon glyphicon-home btn-lg'
		style='text-decoration: none; margin: 10px 20px; color: black;'></a>
	<a class='glyphicon glyphicon-question-sign btn-lg' href='#'
		title='Help' data-toggle='popover' data-placement='left'
		data-trigger='focus' data-content='help demo2'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>demo3</h2>
		</center>
		<form action="../insertForm/demo3" id="iddemo3"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="code"
						tabindex="1" maxlength="5" title="code" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="2"
								title="gender" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value=male data-rule="required" />male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="2"
								title="gender" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value=female data-rule="required" />female<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitdemo3"
						value="Submit" />
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
	</div>
	<div class="container" style="overflow-x: auto;">
		<input id="set" type="button" value="Set" />
		<table id="tabledemo3">
			<thead>
				<tr>
					<th>code</th>
					<th>Gender</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dialogdemo3" style="display: none">
		<form id="dialogformdemo3" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="df_code"
						tabindex=":tabindex" maxlength="5" title="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="df_gender"
								tabindex=":tabindex" title="" value=male />male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="df_gender"
								tabindex=":tabindex" title="" value=female />female<br />
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitdemo3').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#iddemo3'),
			function(err, res) {
				return res;
			},
			options = {
				rules : {
					Digit_Only : function(a) {
						return (new RegExp('^[1-9]{1,}[0-9]{0,}$')).test(a)
					},
				},
				messages : {
					en : {
						Digit_Only : {
							empty : "Only digit allow, first character must be not Zero.",
							incorrect : "Only digit allow, first character must be not Zero."
						},
					}
				}
			});
</script>
<script></script>
<script>
	var oTable = $('#tabledemo3').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $( "#dialogformdemo3" ).validate();
				document.getElementById("dialogformdemo3").reset();
				validator.resetForm();
				$('#dialogdemo3').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "gender"
		}, ],
		"processing" : true,
		"serverSide" : true,
		"paging" : true,
		"ajax" : {
			"contentType" : "application/json",
			"data" : function(d) {
				return JSON.stringify(d);
			},
			"url" : "../listForDatatable/demo3",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
</script>
<script>
	$(function() {
		$('#dialogdemo3').dialog(
				{
					autoOpen : false,
					title : 'demo1',
					height : 500,
					width : 550,
					buttons : {
						'Send' : function() {
							if ($('#dialogformdemo3').valid()) {
								var data = JSON.stringify($('#dialogformdemo3').serializeJSON());
								console.log(data);
								//alert('Success ' + data);
								$('#dialogdemo3').dialog('close');
								
								$.ajax({				
									type : "POST",
									url : "../insert/demo3",
									data: JSON.stringify($('#dialogformdemo3').serializeJSON()),
									contentType: "application/json; charset=utf-8",
							        dataType: "json",
							        cache: false,
									success : function(result) 
									{
										if(result['error']) {
											console.log(result['error']);
											$.each(result['error'], function(key, value) {
												console.log(value);
												document.getElementById("errMessage").innerHTML += "<font color='red'>"+value+"</font><br>";
											});
										} else if(result['success']) {
											console.log(result['success']);
											$.each(result['success'], function(key, value) {
												console.log(value);
												document.getElementById("errMessage").innerHTML += "<font color='green'>"+value+"</font><br>";
											});
										}
									},
									error: function(XMLHttpRequest, textStatus, errorThrown) { 
								        //alert("Status: " + textStatus); alert("Error: " + errorThrown);
								        document.getElementById("errMessage").innerHTML = "<font color='red'>Record insertion failed.</font>";
								    }
								});
								
								//$('#tabledemo3').dataTable();
								$('#tabledemo3').DataTable().draw();
								
							}
						}
					}
				});
		$('#dialogformdemo3').validate({
			rules : {
				code : "required",
				gender : "required"
			}
		});
		$('#set').on('click', function() {
			$("#form").css("display","");
			var data = "[{\"name\":\"code\",\"value\":\"1\"},{\"name\":\"gender\",\"value\":\"male\"}]";
			console.log( data );
			var JsonObject= JSON.parse(data);
			$.each(JsonObject, function(key, value) {
				console.log(value);
				$("#df_"+value.name).val(value.value);
			});
			$('#dialogdemo3').dialog('open');
		});
	});
</script>
</html>
