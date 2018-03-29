<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>temp1</title>
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
		data-trigger='focus' data-content='help'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>temp1</h2>
		</center>
		<form action="../insertForm/temp1" id="idtemp1"
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
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="2"
								title="gender" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value="male" data-rule="required" />male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="2"
								title="gender" rel="tooltip" data-toggle="tooltip"
								data-placement="right" value="female" data-rule="required" />female<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submittemp1"
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
		<table id="tabletemp1">
			<thead>
				<tr>
					<th>code</th>
					<th>Gender</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>code</th>
					<th>Gender</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div id="dialogtemp1" style="display: none">
		<form id="dialogformtemp1" class="form-horizontal">
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
					</div>
					<label id="gender-error" class="error" for="gender"></label>
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
		$('#submittemp1').click(function() {
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
			document.querySelector('#idtemp1'),
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
		if ($.fn.DataTable.isDataTable('#tabletemp1')) {
			$('#tabletemp1').DataTable().clear().destroy();
		}
		var oTable = $('#tabletemp1').dataTable({
			"dom" : 'Blfrtip',
			"buttons" : [ {
				text : 'Add',
				action : function(e, dt, node, config) {
					var validator = $('#dialogformtemp1').validate();
					document.getElementById('dialogformtemp1').reset();
					validator.resetForm();
					$("#formOption").val("add");
					$('#dialogtemp1').dialog('open');
				}
			} ],
			"columns" : [ {
				"data" : "code"
			}, {
				"data" : "gender"
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
					d.formData = $('#idtemp1').serializeArray();
					return JSON.stringify(d);
				},
				"url" : "../listForDatatable/temp1",
				"dataSrc" : "data",
				"type" : "POST"
			}
		});
		$('#tabletemp1_filter input').unbind();
		$('#tabletemp1_filter input').bind('keyup', function(e) {
			if (e.keyCode == 13) {
				oTable.fnFilter(this.value);
			} else if (!this.value.trim()) {
				oTable.fnFilter(this.value);
			}
		});
		$('#tabletemp1 tfoot th')
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
		var validator = $('#dialogformtemp1').validate();
		document.getElementById('dialogformtemp1').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/temp1",
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
							$('#dialogtemp1').dialog('open');
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
						url : "../delete/temp1",
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
					}); /*$('#tabletemp1').DataTable().draw(); */
		}
	}
</script>
<script>
	var oTable = $('#tabletemp1').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformtemp1').validate();
				document.getElementById('dialogformtemp1').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogtemp1').dialog('open');
			}
		} ],
		"columns" : [ {
			"data" : "code"
		}, {
			"data" : "gender"
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
		$('#dialogtemp1')
				.dialog(
						{
							autoOpen : false,
							title : 'temp1',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformtemp1').valid()) {
										var ajaxUrl = "";
										var jsonData = JSON.stringify($(
												'#dialogformtemp1')
												.serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insert/temp1";
											console.log(ajaxUrl);
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../update/temp1";
											jsonData = jsonData.substring(0,
													jsonData.length - 1)
													+ ",\"ID\":\""
													+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogtemp1').dialog('close');
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
																			}); /*$('#tabletemp1').DataTable().draw();*//*oTable.ajax.reload();*/
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
		$('#dialogformtemp1')
				.validate(
						{
							rules : {
								code : {
									required : true,
									pattern : /^[1-9]{1,}[0-9]{0,}$/
								},
								gender : {
									required : true
								},
							},
							messages : {
								df_code : {
									pattern : "Only digit allow, first character must be not Zero."
								},
								gender : {
									required : "Please select Gender"
								},
							}
						});
	});
</script>
</html>
