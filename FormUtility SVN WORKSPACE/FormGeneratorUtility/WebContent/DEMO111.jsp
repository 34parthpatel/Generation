<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>DEMO111</title>
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
		data-trigger='focus' data-content='sdsd'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>DEMO111</h2>
		</center>
		<form action="../insertForm/DEMO111" id="idDEMO111"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">dfd1</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="gfg" id="gfg"
						tabindex="1" maxlength="15" title="int" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">dfd1</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="gfg" id="gfg"
						tabindex="1" maxlength="15" title="int" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitDEMO111"
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
		<table id="tableDEMO111">
			<thead>
				<tr>
					<th>dfd1</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dialogDEMO111" style="display: none">
		<form id="dialogformDEMO111" class="form-horizontal" >
			<input type="hidden" id="formOption" value=""><input
				type="hidden" id="ID" value="">
			<div class="form-group">
				<label class="control-label col-sm-4">dfd1</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="gfg" id="df_gfg"
						tabindex=":tabindex" maxlength="15" title="" />
				</div>
			</div>
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitDEMO111').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idDEMO111'),
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
	var oTable = $('#tableDEMO111').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformDEMO111').validate();
				document.getElementById('dialogformDEMO111').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogDEMO111').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "gfg"
		}, {
			"data" : "edit"
		}, {
			"data" : "delete"
		}, ],
		"columnDefs" : [ {
			orderable : false,
			targets : [ -1, -2 ]
		} ],
		"processing" : true,
		"serverSide" : true,
		"paging" : true,
		"ajax" : {
			"contentType" : "application/json",
			"data" : function(d) {
				return JSON.stringify(d);
			},
			"url" : "../listForDatatable/DEMO111",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
	$('#tableDEMO111_filter input').unbind();
	$('#tableDEMO111_filter input').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			oTable.fnFilter(this.value);
		} else if (!this.value.trim()) {
			oTable.fnFilter(this.value);
		}
	});
	function editRow(id) {
		var validator = $('#dialogformDEMO111').validate();
		document.getElementById('dialogformDEMO111').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/DEMO111",
					data : {
						"id" : id
					},
					cache : false,
					success : function(result) {
						var jsonData = JSON.parse(result);
						if (jsonData['error']) {
							$
									.each(
											jsonData['error'],
											function(key, value) {
												document
														.getElementById("errMessage").innerHTML += "<font color='red'>"
														+ value + "</font><br>";
											});
						} else {
							$
									.each(
											jsonData,
											function(key, value) {
												{
													if (key == 'ID') {
														$("#ID").val(value);
													}
													if ($("#df_" + key).is(
															':radio')) {
														$("input[id=df_"+ key+ "][value=\""+ value+ "\"]").prop('checked',true);
													} else if ($("#df_" + key)
															.is(':checkbox')) {
														if (value.indexOf(',') > -1) {
															var array = value
																	.split(',');
															for (var i = 0; i < array.length; i++) {
																$(
																		"input[id=df_"
																				+ key
																				+ "][value=\""
																				+ array[i]
																				+ "\"]")
																		.prop(
																				'checked',
																				true);
															}
														} else {
															$(
																	"input[id=df_"
																			+ key
																			+ "][value=\""
																			+ value
																			+ "\"]")
																	.prop(
																			'checked',
																			true);
														}
													} else {
														$("#df_" + key).val(
																value);
													}
												}
											});
							$('#dialogDEMO111').dialog('open');
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						document.getElementById("errMessage").innerHTML = "<font color='red'>Problem in fatching data.</font>";
					}
				});
	}
	function deleteRow(id) {
		var value = confirm("Are you sure want to delete this record?");
		if (value == true) {
			document.getElementById("errMessage").innerHTML = "";
			$
					.ajax({
						type : "POST",
						url : "../delete/DEMO111",
						data : "{\"ID\":" + id + "}",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						cache : false,
						success : function(result) {
							if (result['error']) {
								$
										.each(
												result['error'],
												function(key, value) {
													document
															.getElementById("errMessage").innerHTML += "<font color='red'>"
															+ value
															+ "</font><br>";
												});
							} else if (result['success']) {
								$
										.each(
												result['success'],
												function(key, value) {
													document
															.getElementById("errMessage").innerHTML += "<font color='green'>"
															+ value
															+ "</font><br>";
												});
								oTable.rows().remove().draw();
								oTable.draw();
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							document.getElementById("errMessage").innerHTML = "<font color='red'>Record deletion failed.</font>";
						}
					}); /*$('#tableDEMO111').DataTable().draw(); */
		}
	}
</script>
<script>
	$(function() {
		$('#dialogDEMO111')
				.dialog(
						{
							autoOpen : false,
							title : 'DEMO111',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformDEMO111').valid()) {
										var ajaxUrl = "";
										var jsonData = JSON.stringify($(
												'#dialogformDEMO111')
												.serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insert/DEMO111";
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../update/DEMO111";
											jsonData = jsonData.substring(0,
													jsonData.length - 1)
													+ ",\"ID\":\""
													+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogDEMO111').dialog('close');
										$
												.ajax({
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
																			}); /*$('#tableDEMO111').DataTable().draw();*//*oTable.ajax.reload();*/
															oTable.rows()
																	.remove()
																	.draw();
															oTable.rows
																	.add(result);
															oTable.draw();
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
									}
								}
							}
						});
		$('#dialogformDEMO111')
				.validate(
						{
							rules : {
								gfg : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
							},
							messages : {
								df_gfg : {
									pattern : "Only digit allow, first character must be not Zero."
								},
							}
						});
	});
</script>
</html>
