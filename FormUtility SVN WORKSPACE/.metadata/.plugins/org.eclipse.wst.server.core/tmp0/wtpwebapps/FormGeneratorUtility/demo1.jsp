<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>demo1</title>
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
		data-trigger='focus' data-content='help for demo1'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>demo1</h2>
		</center>
		<form action="../insertForm/demo1" id="iddemo1"
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
				<label class="control-label col-sm-4">date</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="date1" id="date1"
						tabindex="2" onkeypress="return false;" readonly title="date"
						rel="tooltip" data-toggle="tooltip" data-placement="right"
						data-rule="required" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitdemo1"
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
		<!-- <input type="button" value="Add" class="btn">
		<br />
		<br /> -->
		<table id="tabledemo1">
			<thead>
				<tr>
					<th>code</th>
					<th>date</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dialog" style="display: none">
		<form id="iddemo11"
			class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="code"
						maxlength="5" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">date</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="date2" id="date2"
						onkeypress="return false;" readonly />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">password</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="password" id="password" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="name" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Residential Address</label>
				<div class="col-sm-5">
					<textarea name="Emp_add" id="Emp_add" class="form-control"
						placeholder="Enter text..." rows="5" cols="30" ></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Project name</label>
				<div class="col-sm-5">
					<input type="checkbox" name="projectname" id="projectname"
						value=HSIIDC /> HSIIDC<br />
					<input type="checkbox" name="projectname" id="projectname"
						value=CRM /> CRM<br />
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
		$('#submitdemo1').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#iddemo1'),
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
<script>
	$('#date1').datetimepicker({
		timepicker : false,
		minDate : '-1970/01/01',
		format : 'Y-m-d',
		formatDate : 'Y-m-d',
	});
	$('#date2').datetimepicker({
		timepicker : false,
		minDate : '-1970/01/01',
		format : 'Y-m-d',
		formatDate : 'Y-m-d',
	});
</script>
<script>
	var oTable = $('#tabledemo1').dataTable({
		"dom" : 'Blfrtip',
        "buttons" : [
            {
                text: 'Add',
                action: function ( e, dt, node, config ) {
        			$('#dialog').dialog('open');
                }
            }
        ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "date1"
		}, ],
		"processing" : true,
		"serverSide" : true,
		"paging" : true,
		"ajax" : {
			"contentType" : "application/json",
			"data" : function(d) {
				return JSON.stringify(d);
			},
			"url" : "../listForDatatable/demo1",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#dialog').dialog({
			autoOpen : false,
			title:'demo1',
			height: 500,
            width: 550,
			buttons : {
				'Send' : function() {
					if ($('#iddemo11').valid()) {
						var data = JSON.stringify( $("#iddemo11").serializeArray() );
						console.log( data );
						alert('Success ' + data);
						$('#dialog').dialog('close');
					}
				}
			}
		});
		$('#iddemo11').validate({
			rules : {
				code : "required",
				name: {
					pattern: /^[a-zA-Z'.\s]{1,5}$/
				},
				password:{
					required: true,
					minlength: 5,
					equalTo: "password"
				},
				projectname:{
					required: true,
				},
				gender: {
					required: true,
				},
			},
			messages: {
				name: {
		            pattern: 'The Textbox string format is invalid'
		        },
				password: {
					required: "Psw must required.",
					minlength: "Must be 5 char long",
					equalTo: "equal to password"
				},
				projectname: "Please select project",
				gender: "Please select gender",
			}
		});
	});
</script>
</html>
