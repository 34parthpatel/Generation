<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>dmeo55</title>
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
		data-trigger='focus' data-content='file'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>dmeo55</h2>
		</center>
		<form action="../insertForm/dmeo55" id="iddmeo55"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="code"
						tabindex="1" maxlength="5" title="code" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Aplha_numeric" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="name"
						tabindex="2" maxlength="15" title="name" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Only_aplha" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitdmeo55"
						value="Submit" /><input type='button' class='btn Info'
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
	</div>
	<div class="container" style="overflow-x: auto;">
		<table id="tabledmeo55">
			<thead>
				<tr>
					<th>code</th>
					<th>name</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>code</th>
					<th>name</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div id="dialogdmeo55" style="display: none">
		<form id="dialogformdmeo55" class="form-horizontal">
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
				<label class="control-label col-sm-4">name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="df_name"
						tabindex=":tabindex" maxlength="15" title="" />
				</div>
			</div>
		</form>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	var returnType = true;
	var errMessage = "";
	$(function() {
		$('#submitdmeo55').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return returnType;
		});
	});
	function checkFile(id) {
		checkFileType(id);
	}
</script>
<script>
	new Validator(document.querySelector('#iddmeo55'), function(err, res) {
		return res;
	}, options = {
		rules : {
			Aplha_numeric : function(a) {
				return (new RegExp('^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$'))
						.test(a)
			},
			Only_aplha : function(a) {
				return (new RegExp('^[A-Za-z]{0,}$')).test(a)
			},
		},
		messages : {
			en : {
				Aplha_numeric : {
					empty : "Only alphanumeric allow.",
					incorrect : "Only alphanumeric allow."
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
	function loadDataTable() {
		if ($.fn.DataTable.isDataTable('#tabledmeo55')) {
			$('#tabledmeo55').DataTable().clear().destroy();
		}
		var oTable = $('#tabledmeo55').dataTable({
			"dom" : 'Blfrtip',
			"buttons" : [ {
				text : 'Add',
				action : function(e, dt, node, config) {
					var validator = $('#dialogformdmeo55').validate();
					document.getElementById('dialogformdmeo55').reset();
					validator.resetForm();
					$("#formOption").val("add");
					$('#dialogdmeo55').dialog('open');
				}
			} ],
			"columns" : [ {
				"data" : "code"
			}, {
				"data" : "name"
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
					d.formData = $('#iddmeo55').serializeArray();
					return JSON.stringify(d);
				},
				"url" : "../listForDatatable/dmeo55",
				"dataSrc" : "data",
				"type" : "POST"
			}
		});
		$('#tabledmeo55_filter input').unbind();
		$('#tabledmeo55_filter input').bind('keyup', function(e) {
			if (e.keyCode == 13) {
				oTable.fnFilter(this.value);
			} else if (!this.value.trim()) {
				oTable.fnFilter(this.value);
			}
		});
		$('#tabledmeo55 tfoot th')
				.each(
						function() {
							var title = $(this).text();
							if (!(title.toUpperCase() == ('edit').toUpperCase())
									&& !(title.toUpperCase() == ('delete')
											.toUpperCase())) {
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
	function editRow(id) {
		var validator = $('#dialogformdmeo55').validate();
		document.getElementById('dialogformdmeo55').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/dmeo55",
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
													} else if ($("#df_" + key)
															.is(':file')) {
													} else {
														$("#df_" + key).val(
																value);
													}
												}
											});
							$('#dialogdmeo55').dialog('open');
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
						url : "../delete/dmeo55",
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
					}); /*$('#tabledmeo55').DataTable().draw(); */
		}
	}
</script>
<script>
	var oTable = $('#tabledmeo55').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformdmeo55').validate();
				document.getElementById('dialogformdmeo55').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogdmeo55').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "name"
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
		"serverSide" : false,
		"paging" : true,
	});
</script>
<script>
	$(function() {
		$('#dialogdmeo55')
				.dialog(
						{
							autoOpen : false,
							title : 'dmeo55',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformdmeo55').valid()) {
										var ajaxUrl = "";
										var jsonData = JSON.stringify($(
												'#dialogformdmeo55')
												.serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insert/dmeo55";
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../update/dmeo55";
											jsonData = jsonData.substring(0,
													jsonData.length - 1)
													+ ",\"ID\":\""
													+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogdmeo55').dialog('close');
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
																			}); /*$('#tabledmeo55').DataTable().draw();*//*oTable.ajax.reload();*/
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
		$('#dialogformdmeo55').validate({
			rules : {
				code : {
					required : true,
					pattern : /^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$/
				},
				name : {
					required : true,
					pattern : /^[A-Za-z]{0,}$/
				},
			},
			messages : {
				df_code : {
					pattern : "Only alphanumeric allow."
				},
				df_name : {
					pattern : "Only alphabets allow."
				},
			}
		});
	});
</script>
</html>
