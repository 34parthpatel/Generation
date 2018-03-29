<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>file_demo</title>
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
		data-trigger='focus' data-content='file demo'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>file_demo</h2>
		</center>
		<form action="../insertForm/file_demo" id="idfile_demo" enctype="multipart/form-data"
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
				<label class="control-label col-sm-4">File</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="file"
						id="file" tabindex="2" title="file" rel="tooltip"
						data-toggle="tooltip" data-placement="right" multiple />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitfile_demo"
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
		<table id="tablefile_demo">
			<thead>
				<tr>
					<th>code</th>
					<th>File</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>code</th>
					<th>File</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div id="dialogfile_demo" style="display: none">
		<form id="dialogformfile_demo" class="form-horizontal">
			<input type="hidden" id="formOption" value=""><input
				type="hidden" id="ID" value="">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="df_code"
						tabindex=":tabindex" maxlength="5" title="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">File</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="file"
						id="file" tabindex=":tabindex" title="" multiple />
				</div>
			</div>
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitfile_demo').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idfile_demo'),
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
	var oTable = $('#tablefile_demo').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformfile_demo').validate();
				document.getElementById('dialogformfile_demo').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogfile_demo').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "file"
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
			"url" : "../listForDatatable/file_demo",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
	$('#tablefile_demo_filter input').unbind();
	$('#tablefile_demo_filter input').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			oTable.fnFilter(this.value);
		} else if (!this.value.trim()) {
			oTable.fnFilter(this.value);
		}
	});
	$('#tablefile_demo tfoot th').each(function() {
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
		var validator = $('#dialogformfile_demo').validate();
		document.getElementById('dialogformfile_demo').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/file_demo",
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
							$('#dialogfile_demo').dialog('open');
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
			$.ajax({
				type : "POST",
				url : "../delete/file_demo",
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
			}); /*$('#tablefile_demo').DataTable().draw(); */
		}
	}
	function downloadFile(name)
	{
		alert(name);
		$.ajax({
			type : "POST",
			url : "../downloadFile/file_demo",
			data : {
				"fileName" : name
			},
			cache : false,
			success : function(result) {
				document.getElementById("errMessage").innerHTML += "<font color='green'>Success</font><br>";
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				document.getElementById("errMessage").innerHTML = "<font color='red'>Not Success.</font>";
			}
		});
	}
</script>
<script>
	$(function() {
		$('#dialogfile_demo')
				.dialog(
						{
							autoOpen : false,
							title : 'file_demo',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformfile_demo').valid()) {
										var ajaxUrl = "";
										var jsonData = JSON.stringify($(
												'#dialogformfile_demo')
												.serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insert/file_demo";
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../update/file_demo";
											jsonData = jsonData.substring(0,
													jsonData.length - 1)
													+ ",\"ID\":\""
													+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogfile_demo').dialog('close');
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
																			}); /*$('#tablefile_demo').DataTable().draw();*//*oTable.ajax.reload();*/
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
		$('#dialogformfile_demo')
				.validate(
						{
							rules : {
								code : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
							},
							messages : {
								df_code : {
									pattern : "Only digit allow, first character must be not Zero."
								},
							}
						});
	});
</script>
</html>
