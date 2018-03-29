<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>employee0502</title>
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
		data-trigger='focus' data-content='help demo4'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>employee0502</h2>
		</center>
		<form action="../insertForm/employee0502" id="idemployee0502"
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
				<label class="control-label col-sm-4">demoField</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="demofield"
						id="demofield" tabindex="2" maxlength="5" title="demoField"
						rel="tooltip" data-toggle="tooltip" data-placement="right"
						data-rule="required|Only_aplha" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="password"
						id="password" tabindex="3" maxlength="10" title="psw"
						rel="tooltip" data-toggle="tooltip" data-placement="right"
						data-rule="|Password" /><input type="checkbox"
						onclick="showPassword('password')">Show Password
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="4"
								title="gender" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value=male data-rule="required" />male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="4"
								title="gender" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value=female data-rule="required" />female<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">check</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="box" id="box1" tabindex="5"
								title="check box" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value=onw /> onw<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="box" id="box3" tabindex="5"
								title="check box" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value=two /> two<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">select</label>
				<div class="col-sm-5">
					<select class="form-control" name="combobox" id="combobox"
						tabindex="6" title="combobox" rel="tooltip" data-toggle="tooltip"
						data-placement="right"><option value='' selected>Please
							select</option>
						<option value='one'>one</option>
						<option value='two'>two</option></select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">number</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="num1" id="num1"
						tabindex="8" step="1" title="num" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success"
						id="submitemployee0502" value="Submit" />
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
		<table id="tableemployee0502">
			<thead>
				<tr>
					<th>code</th>
					<th>demoField</th>
					<th>password</th>
					<th>Gender</th>
					<th>check</th>
					<th>select</th>
					<th>number</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dialogemployee0502" style="display: none">
		<form id="dialogformemployee0502" class="form-horizontal">
			<input type="hidden" id="formOption" value="">
			<input type="hidden" id="ID" value="">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="df_code"
						tabindex=":tabindex" maxlength="5" title="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">demoField</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="demofield"
						id="df_demofield" tabindex=":tabindex" maxlength="5" title="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="password"
						id="df_password" tabindex=":tabindex" maxlength="10" title="" /><input
						type="checkbox" onclick="showPassword('df_password')">Show
					Password<label id="df_password-error" class="error"
						for="df_password"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="df_gender"
								tabindex=":tabindex" title="" value="male" />male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="df_gender"
								tabindex=":tabindex" title="" value="female" />female<br />
						</div>
						<label id="gender-error" class="error" for="gender"></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">check</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="box" id="df_box"
								tabindex=":tabindex" title="" value="onw" /> onw<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="box" id="df_box"
								tabindex=":tabindex" title="" value="two" /> two<br />
						</div>
						<label id="box-error" class="error" for="box"></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">select</label>
				<div class="col-sm-5">
					<select class="form-control" name="combobox" id="df_combobox"
						tabindex="6" title=""><option value='' selected>Please
							select</option>
						<option value='one'>one</option>
						<option value='two'>two</option></select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">number</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="num1" id="df_num1"
						tabindex=":tabindex" step="1" title="" />
				</div>
			</div>
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitemployee0502')
				.click(
						function() {
							if (!$('input[name=box]:checked').length > 0) {
								document.getElementById("errMessage").innerHTML = "check can not be null";
								return false;
							}
							document.getElementById("errMessage").innerHTML = "";
							return true;
						});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idemployee0502'),
			function(err, res) {
				return res;
			},
			options = {
				rules : {
					Digit_Only : function(a) {
						return (new RegExp('^[1-9]{1,}[0-9]{0,}$')).test(a)
					},
					Only_aplha : function(a) {
						return (new RegExp('^[A-Za-z]{0,}$')).test(a)
					},
					Password : function(a) {
						return (new RegExp(
								'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\\S+$).{8,}'))
								.test(a)
					},
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
						Only_aplha : {
							empty : "Only alphabets allow.",
							incorrect : "Only alphabets allow."
						},
						Password : {
							empty : "Password must be, 2 Letter Capital,2 special char ,and any letter and any digit",
							incorrect : "Password must be, 2 Letter Capital,2 special char ,and any letter and any digit"
						},
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
	var oTable = $('#tableemployee0502').DataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformemployee0502').validate();
				document.getElementById('dialogformemployee0502').reset();
				validator.resetForm();
				$("#formOption").val("add");
				console.log($("#formOption").val());
				$('#dialogemployee0502').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "demofield"
		}, {
			"data" : "password"
		}, {
			"data" : "gender"
		}, {
			"data" : "box"
		}, {
			"data" : "combobox"
		}, {
			"data" : "num1"
		}, {
			"data" : "edit",
			/* "className" : "center",
            "defaultContent" : "<a href='#' class='editor_edit' onclick=\"editRow('2')\">Edit</a>" */
		}, {
			"data" : "delete"
		}, ],
		"processing" : true,
		"serverSide" : true,
		"paging" : true,
		"ajax" : {
			"contentType" : "application/json",
			"data" : function(d) {
				return JSON.stringify(d);
			},
			"url" : "../listForDatatable/employee0502",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
	
	function editRow(id)
	{
		console.log(id);
		//var oTable = $('#tableemployee0502').DataTable();
		var validator = $('#dialogformemployee0502').validate();
		document.getElementById('dialogformemployee0502').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		console.log($("#formOption").val());
		var allData = oTable.row(id-1).data();
		console.log(allData);
		//var data = "[{\"name\":\"code\",\"value\":\"1\"},{\"name\":\"gender\",\"value\":\"male\"}]";
		//console.log( data );
		//var JsonObject= JSON.parse(allData);
		$.each(allData, function(key, value) {
			//console.log(key);
			if(key=='id') {
				console.log("...ID " + value);
				$("#ID").val(value);
			}
			if($("#df_"+key).is(':radio')) {
				/* $("#df_"+key).prop("checked", "checked"); */
				$("input[name="+key+"][value=\"" + value + "\"]").prop('checked', true);
				console.log("radio");
		    } else if($("#df_"+key).is(':checkbox')) {
		    	$("input[name="+key+"][value=\"" + value + "\"]").prop('checked', true);
				console.log("checkbox");
		    } else {
		    	$("#df_"+key).val(value);
		    }
		});
		$('#dialogemployee0502').dialog('open');
	}
	
	function deleteRow(id)
	{
		console.log(id);
		var value = confirm("Are you sure want to delete this record?");
		if(value == true) {
			$.ajax({				
				type : "POST",
				url : "../delete/employee0502",
				data: "{\"ID\":\""+id+"\"}",
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
			$('#tableemployee0502').DataTable().draw();
		}
	}
</script>
<script>
	$(function() {
		$('#dialogemployee0502')
				.dialog(
						{
							autoOpen : false,
							title : 'employee0502',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformemployee0502').valid()) {
										var ajaxUrl = "";
										var jsonData = JSON.stringify($('#dialogformemployee0502').serializeJSON());
										if($("#formOption").val() == "add") {
											console.log("goes in add");
											ajaxUrl = "../insert/employee0502";
										} else if ($("#formOption").val() == "edit") {
											console.log("goes in edit");
											ajaxUrl = "../update/employee0502";
											jsonData = jsonData.substring(0, jsonData.length-1) + ",\"ID\":\""+$("#ID").val()+"\"}";
											console.log("jsonData " + jsonData);
										} else {
											console.log("goes...");
											ajaxUrl = "";
										}
										//var data = JSON.stringify($('#dialogformemployee0502').serializeJSON());
										
										$('#dialogemployee0502').dialog('close');
										$.ajax({
													type : "POST",
													url : ajaxUrl,
													data : jsonData,
													contentType : "application/json; charset=utf-8",
													dataType : "json",
													cache : false,
													success : function(result) {
														if (result['error']) {
															console
																	.log(result['error']);
															$
																	.each(
																			result['error'],
																			function(
																					key,
																					value) {
																				console
																						.log(value);
																				document
																						.getElementById("errMessage").innerHTML = "";
																				document
																						.getElementById("errMessage").innerHTML += "<font color='red'>"
																						+ value
																						+ "</font><br>";
																			});
														} else if (result['success']) {
															console
																	.log(result['success']);
															$
																	.each(
																			result['success'],
																			function(
																					key,
																					value) {
																				console
																						.log(value);
																				document
																						.getElementById("errMessage").innerHTML = "";
																				document
																						.getElementById("errMessage").innerHTML += "<font color='green'>"
																						+ value
																						+ "</font><br>";
																			});
														}
													},
													error : function(
															XMLHttpRequest,
															textStatus,
															errorThrown) {
														document
																.getElementById("errMessage").innerHTML = "<font color='red'>Record insertion failed.</font>";
													}
												});
										$('#tableemployee0502').DataTable().draw();
									}
								}
							}
						});
		$('#dialogformemployee0502')
				.validate(
						{
							rules : {
								code : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
								demofield : {
									required : true,
									pattern : /^[A-Za-z]{0,}$/
								},
								password : {
									pattern : /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\S+$).{8,}/
								},
								gender : {
									required : true
								},
								box : {
									required : true
								},
								num1 : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
							},
							messages : {
								df_code : {
									pattern : "Only digit allow, first character must be not Zero."
								},
								df_demofield : {
									pattern : "Only alphabets allow."
								},
								df_password : {
									pattern : "Password must be, 2 Letter Capital,2 special char ,and any letter and any digit"
								},
								gender : {
									required : "Please select Gender"
								},
								box : {
									required : "Please select atleast one check"
								},
								df_num1 : {
									pattern : "Only digit allow, first character must be not Zero."
								},
							}
						});
	});
</script>
</html>
