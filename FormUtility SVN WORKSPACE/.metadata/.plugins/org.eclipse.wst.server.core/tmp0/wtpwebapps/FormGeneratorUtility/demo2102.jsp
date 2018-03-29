<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>demo2102</title>
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
		data-trigger='focus' data-content='demo2102'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>demo2102</h2>
		</center>
		<form action="../insertForm/demo2102" id="iddemo2102"
			class="form-horizontal" method="post" enctype="multipart/form-data">
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
				<label class="control-label col-sm-4">Aadhar</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="aadhar" id="aadhar"
						tabindex="2" title="aadhar" accept=":accept" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						onchange="checkFile('aadhar')" multiple />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Pan</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="pan" id="pan"
						tabindex="3" title="Pan" accept=":accept" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						onchange="checkFile('pan')" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitdemo2102"
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
		<table id="tabledemo2102">
			<thead>
				<tr>
					<th>code</th>
					<th>Aadhar</th>
					<th>Pan</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>code</th>
					<th>Aadhar</th>
					<th>Pan</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div id="dialogdemo2102" style="display: none">
		<form id="dialogformdemo2102" class="form-horizontal">
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
				<label class="control-label col-sm-4">Aadhar</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="aadhar"
						id="df_aadhar" tabindex=":tabindex" title="" accept="image/*"
						multiple />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Pan</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="pan" id="df_pan"
						tabindex=":tabindex" title="" accept="application/pdf" />
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
		$('#submitdemo2102')
				.click(
						function() {
							var control = document.getElementById("aadhar");
							var files = control.files;
							if (files.length == 0) {
								document.getElementById("errMessage").innerHTML = "Please select file.";
								return false;
							} else if (errMessage != "") {
								document.getElementById("errMessage").innerHTML = errMessage;
								return false;
							}
							var control = document.getElementById("pan");
							var files = control.files;
							if (files.length == 0) {
								document.getElementById("errMessage").innerHTML = "Please select file.";
								return false;
							} else if (errMessage != "") {
								document.getElementById("errMessage").innerHTML = errMessage;
								return false;
							}
							document.getElementById("errMessage").innerHTML = "";
							return returnType;
						});
	});
	function checkFile(id) {
		checkFileType(id);
	}
</script>
<script>
	new Validator(
			document.querySelector('#iddemo2102'),
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
	function loadDataTable() {
		if ($.fn.DataTable.isDataTable('#tabledemo2102')) {
			$('#tabledemo2102').DataTable().clear().destroy();
		}
		var oTable = $('#tabledemo2102').dataTable({
			"dom" : 'Blfrtip',
			"buttons" : [ {
				text : 'Add',
				action : function(e, dt, node, config) {
					var validator = $('#dialogformdemo2102').validate();
					document.getElementById('dialogformdemo2102').reset();
					validator.resetForm();
					$("#formOption").val("add");
					$('#dialogdemo2102').dialog('open');
				}
			} ],
			"columns" : [ {
				"data" : "code"
			}, {
				"data" : "aadhar"
			}, {
				"data" : "pan"
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
					d.formData = $('#iddemo2102').serializeArray();
					return JSON.stringify(d);
				},
				"url" : "../listForDatatable/demo2102",
				"dataSrc" : "data",
				"type" : "POST"
			}
		});
		$('#tabledemo2102_filter input').unbind();
		$('#tabledemo2102_filter input').bind('keyup', function(e) {
			if (e.keyCode == 13) {
				oTable.fnFilter(this.value);
			} else if (!this.value.trim()) {
				oTable.fnFilter(this.value);
			}
		});
		$('#tabledemo2102 tfoot th')
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
		var validator = $('#dialogformdemo2102').validate();
		document.getElementById('dialogformdemo2102').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/demo2102",
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
							$('#dialogdemo2102').dialog('open');
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
						url : "../delete/demo2102",
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
					}); /*$('#tabledemo2102').DataTable().draw(); */
		}
	}
	function downloadFile(names) {
		var val = confirm("Do you want to download file/files?");
		if (val == true) {
			var name = names.split("|");
			for (var i = 0; i < name.length; i++) {
				download(name[i]);
			}
		}
	}
</script>
<script>
	var oTable = $('#tabledemo2102').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformdemo2102').validate();
				document.getElementById('dialogformdemo2102').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogdemo2102').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "aadhar"
		}, {
			"data" : "pan"
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
		$('#dialogdemo2102')
				.dialog(
						{
							autoOpen : false,
							title : 'demo2102',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformdemo2102').valid()) {
										var formData = new FormData(
												$('#dialogformdemo2102')[0]);
										var ajaxUrl = "";
										var jsonData = JSON.stringify($(
												'#dialogformdemo2102')
												.serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insertWithFile/demo2102";
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../updateWithFile/demo2102";
											formData.append("ID", $("#ID")
													.val());
											jsonData = jsonData.substring(0,
													jsonData.length - 1)
													+ ",\"ID\":\""
													+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogdemo2102').dialog('close');
										$
												.ajax({
													type : "POST",
													url : ajaxUrl,
													data : formData,
													contentType : "application/json; charset=utf-8",
													dataType : "json",
													cache : false,
													enctype : 'multipart/form-data',
													processData : false,
													contentType : false,
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
																			}); /*$('#tabledemo2102').DataTable().draw();*//*oTable.ajax.reload();*/
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
														if ($("#formOption")
																.val() == "add") {
															document
																	.getElementById("errMessage").innerHTML = "<font color='red'>Record insertion failed.</font>";
														} else if ($(
																"#formOption")
																.val() == "edit") {
															document
																	.getElementById("errMessage").innerHTML = "<font color='red'>Record updation failed.</font>";
														}
													}
												});
									}
								}
							}
						});
		$('#dialogformdemo2102')
				.validate(
						{
							rules : {
								code : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
								aadhar : {
									required : true,
									accept : "image/*",
									filesize : 1024000,
								},
								pan : {
									required : true,
									accept : "application/pdf",
									filesize : 1024000,
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
