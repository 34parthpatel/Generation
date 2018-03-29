<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>demo5</title>
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
		data-trigger='focus' data-content='help demo4'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>demo5</h2>
		</center>
		<form action="../insertForm/demo5" id="iddemo5"
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
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitdemo5"
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
		<table id="tabledemo5">
			<thead>
				<tr>
					<th>code</th>
					<th>demoField</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dialogdemo5" style="display: none">
		<form id="dialogformdemo5" class="form-horizontal">
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
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitdemo5').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#iddemo5'),
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
					}
				}
			});
</script>
<script></script>
<script>
	var oTable = $('#tabledemo5').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformdemo5').validate();
				document.getElementById('dialogformdemo5').reset();
				validator.resetForm();
				$('#dialogdemo5').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "demofield"
		}, ],
		"processing" : true,
		"serverSide" : true,
		"paging" : true,
		"ajax" : {
			"contentType" : "application/json",
			"data" : function(d) {
				return JSON.stringify(d);
			},
			"url" : "../listForDatatable/demo5",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
</script>
<script>
	$(function() {
		$('#dialogdemo5')
				.dialog(
						{
							autoOpen : false,
							title : 'demo1',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformdemo5').valid()) {
										var data = JSON.stringify($(
												'#dialogformdemo5')
												.serializeJSON());
										console.log(data);
										$('#dialogdemo5').dialog('close');
										$
												.ajax({
													type : "POST",
													url : "../insert/demo5",
													data : JSON.stringify($(
															'#dialogformdemo5')
															.serializeJSON()),
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
										$('#tabledemo5').DataTable().draw();
									}
								}
							}
						});
		$('#dialogformdemo5')
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
							},
							messages : {
								df_code : {
									pattern : "Only digit allow, first character must be not Zero."
								},
								df_demofield : {
									pattern : "Only alphabets allow."
								},
							}
						});
	});
</script>
</html>
