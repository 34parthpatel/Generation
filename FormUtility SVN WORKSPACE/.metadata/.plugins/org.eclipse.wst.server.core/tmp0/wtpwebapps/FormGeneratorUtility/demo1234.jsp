<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>demo1234</title>
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
		data-trigger='focus' data-content='help for demo1234'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>demo1234</h2>
		</center>
		<form action="../insertForm/demo1234" id="iddemo1234"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="emp_code"
						id="emp_code" tabindex="1" maxlength="5" title="emp code"
						rel="tooltip" data-toggle="tooltip" data-placement="right"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">address</label>
				<div class="col-sm-5">
					<textarea name="address" id="address" class="form-control"
						placeholder="Enter text..." rows="5" cols="30" tabindex="2"
						maxlength="250" title="emp address" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Address_Validation"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitdemo1234"
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
		<table id="tabledemo1234">
			<thead>
				<tr>
					<th>code</th>
					<th>address</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>code</th>
					<th>address</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div id="dialogdemo1234" style="display: none">
		<form id="dialogformdemo1234" class="form-horizontal">
			<input type="hidden" id="formOption" value=""><input
				type="hidden" id="ID" value="">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="emp_code"
						id="df_emp_code" tabindex=":tabindex" maxlength="5" title="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">address</label>
				<div class="col-sm-5">
					<textarea name="address" id="df_address" class="form-control"
						placeholder="Enter text..." rows="5" cols="30"
						tabindex=":tabindex" maxlength="250" title=""></textarea>
				</div>
			</div>
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitdemo1234').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#iddemo1234'),
			function(err, res) {
				return res;
			},
			options = {
				rules : {
					Digit_Only : function(a) {
						return (new RegExp('^[1-9]{1,}[0-9]{0,}$')).test(a)
					},
					Address_Validation : function(a) {
						return (new RegExp('^[A-Za-z0-9,/-]{1,}$')).test(a)
					},
				},
				messages : {
					en : {
						Digit_Only : {
							empty : "Only digit allow, first character must be not Zero.",
							incorrect : "Only digit allow, first character must be not Zero."
						},
						Address_Validation : {
							empty : "Please enter proper address...",
							incorrect : "Please enter proper address..."
						},
					}
				}
			});
</script>
<script></script>
<script>
	var oTable = $('#tabledemo1234').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformdemo1234').validate();
				document.getElementById('dialogformdemo1234').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogdemo1234').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "emp_code"
		}, {
			"data" : "address"
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
			"url" : "../listForDatatable/demo1234",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
	$('#tabledemo1234_filter input').unbind();
	$('#tabledemo1234_filter input').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			oTable.fnFilter(this.value);
		} else if (!this.value.trim()) {
			oTable.fnFilter(this.value);
		}
	});
	$('#tabledemo1234 tfoot th').each(function() {
		var title = $(this).text();
		$(this).html('<input type="text" placeholder="Search '+title+'" />');
	});
	oTable.api().columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change', function(e) {
			if (e.keyCode == 13) {
				that.search(this.value).draw();
			}
		});
	});
	function editRow(id) {
		var validator = $('#dialogformdemo1234').validate();
		document.getElementById('dialogformdemo1234').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/demo1234",
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
														$(
																"input[id=df_"
																		+ key
																		+ "][value=\""
																		+ value
																		+ "\"]")
																.prop(
																		'checked',
																		true);
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
							$('#dialogdemo1234').dialog('open');
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
						url : "../delete/demo1234",
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
								oTable.api().rows().remove().draw();
								oTable.api().draw();
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							document.getElementById("errMessage").innerHTML = "<font color='red'>Record deletion failed.</font>";
						}
					}); /*$('#tabledemo1234').DataTable().draw(); */
		}
	}
</script>
<script>
	$(function() {
		$('#dialogdemo1234')
				.dialog(
						{
							autoOpen : false,
							title : 'demo1234',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformdemo1234').valid()) {
										var ajaxUrl = "";
										var jsonData = JSON.stringify($(
												'#dialogformdemo1234')
												.serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insert/demo1234";
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../update/demo1234";
											jsonData = jsonData.substring(0,
													jsonData.length - 1)
													+ ",\"ID\":\""
													+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogdemo1234').dialog('close');
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
																			}); /*$('#tabledemo1234').DataTable().draw();*//*oTable.ajax.reload();*/
															oTable.api().rows()
																	.remove()
																	.draw();
															oTable.api().rows
																	.add(result);
															oTable.api().draw();
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
		$('#dialogformdemo1234')
				.validate(
						{
							rules : {
								emp_code : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
								address : {
									required : true,
									pattern : /^[A-Za-z0-9,/-]{1,}$/
								},
							},
							messages : {
								df_emp_code : {
									pattern : "Only digit allow, first character must be not Zero."
								},
								df_address : {
									pattern : "Please enter proper address..."
								},
							}
						});
	});
</script>
</html>
