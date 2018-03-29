<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@include
	file="datatableLib.jsp"%><!DOCTYPE html >
<html>
<head>
<title>Gautam_file_TEST</title>
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
		data-trigger='focus' data-content='This form for test'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>Gautam_file_TEST</h2>
		</center>
		<form action="../insertForm/Gautam_file_TEST" id="idGautam_file_TEST"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-4">CODE</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="code"
						tabindex="1" maxlength="10" title="Test" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Aplha_numeric" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">INput File</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="file" id="file"
						tabindex="2" title="file test" rel="tooltip" data-toggle="tooltip"
						data-placement="right" onchange="checkFile('file')" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success"
						id="submitGautam_file_TEST" value="Submit" /><input type='button'
						class='btn Info' id='search' onclick='loadDataTable()'
						value='Search' />
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
		<table id="tableGautam_file_TEST">
			<thead>
				<tr>
					<th>CODE</th>
					<th>INput File</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>CODE</th>
					<th>INput File</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div id="dialogGautam_file_TEST" style="display: none">
		<form id="dialogformGautam_file_TEST" class="form-horizontal" method="post" >
			<input type="hidden" id="formOption" value=""><input
				type="hidden" id="ID" value="">
			<div class="form-group">
				<label class="control-label col-sm-4">CODE</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="df_code"
						tabindex=":tabindex" maxlength="10" title="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">INput File</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="file" id="df_file"
						tabindex=":tabindex" title="" accept="image/*,audio/*," onchange="checkFile('df_file')" />
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
		$('#submitGautam_file_TEST').click(
			function() {
				var control = document.getElementById("file");
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
	new Validator(document.querySelector('#idGautam_file_TEST'), function(err,
			res) {
		return res;
	}, options = {
		rules : {
			Aplha_numeric : function(a) {
				return (new RegExp('^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$'))
						.test(a)
			},
		},
		messages : {
			en : {
				Aplha_numeric : {
					empty : "Only alphanumeric allow.",
					incorrect : "Only alphanumeric allow."
				},
			}
		}
	});
</script>
<script></script>
<script>
	var oTable = $('#tableGautam_file_TEST').dataTable({
		"dom" : 'Blfrtip',
		"buttons" : [ {
			text : 'Add',
			action : function(e, dt, node, config) {
				var validator = $('#dialogformGautam_file_TEST').validate();
				document.getElementById('dialogformGautam_file_TEST').reset();
				validator.resetForm();
				$("#formOption").val("add");
				$('#dialogGautam_file_TEST').dialog('open');
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
			"url" : "../listForDatatable/Gautam_file_TEST",
			"dataSrc" : "data",
			"type" : "POST"
		}
	});
	$('#tableGautam_file_TEST_filter input').unbind();
	$('#tableGautam_file_TEST_filter input').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			oTable.fnFilter(this.value);
		} else if (!this.value.trim()) {
			oTable.fnFilter(this.value);
		}
	});
	$('#tableGautam_file_TEST tfoot th').each(function() {
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
		var validator = $('#dialogformGautam_file_TEST').validate();
		document.getElementById('dialogformGautam_file_TEST').reset();
		validator.resetForm();
		$("#ID").val("");
		$("#formOption").val("edit");
		document.getElementById("errMessage").innerHTML = "";
		$
				.ajax({
					type : "POST",
					url : "../restFatchDataFromID/Gautam_file_TEST",
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
													} else if($("#df_" + key).is(':file')) {
														
													} else {
														$("#df_" + key).val(
																value);
													}
												}
											});
							$('#dialogGautam_file_TEST').dialog('open');
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
						url : "../delete/Gautam_file_TEST",
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
					}); /*$('#tableGautam_file_TEST').DataTable().draw(); */
		}
	}
	function downloadFile(name) {
		download(name);
	}
</script>
<script>
	$(function() {
		$('#dialogGautam_file_TEST')
				.dialog(
						{
							autoOpen : false,
							title : 'Gautam_file_TEST',
							height : 500,
							width : 550,
							buttons : {
								'Send' : function() {
									if ($('#dialogformGautam_file_TEST')
											.valid()) {
										//var form = document.getElementById('dialogformGautam_file_TEST');
							            //var data = new FormData(form);
										var formData = new FormData($("#dialogformGautam_file_TEST")[0]);
										console.log(formData);
										//var convertedJSON = {};
										var ajaxUrl = "";
										var jsonData = JSON.stringify($('#dialogformGautam_file_TEST').serializeJSON());
										if ($("#formOption").val() == "add") {
											ajaxUrl = "../insertWithFile/Gautam_file_TEST";
											//formData.append("file", file);
											//formData.append("ad",JSON.stringify($('#dialogformGautam_file_TEST').serializeJSON()));
										    /* formData.forEach(function(value, key) { 
										        convertedJSON[key] = value;
										    }); */
											//console.log(convertedJSON);
										} else if ($("#formOption").val() == "edit") {
											ajaxUrl = "../update/Gautam_file_TEST";
											jsonData = jsonData.substring(0, jsonData.length - 1)+ ",\"ID\":\""+ $("#ID").val() + "\"}";
										} else {
											ajaxUrl = "";
										}
										$('#dialogGautam_file_TEST').dialog(
												'close');
										$.ajax({
											url: ajaxUrl,
											type: "POST",
								            data: formData,
								            cache: false,
								            dataType : 'json',
								            enctype: 'multipart/form-data',
								            processData: false,
								            contentType: false,
								            //timeout: 600000,
								            success: function (result) {
								                console.log("SUCCESS : ", result);
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
																	}); /*$('#tableGautam_file_TEST').DataTable().draw();*//*oTable.ajax.reload();*/
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
		$('#dialogformGautam_file_TEST').validate({
			rules : {
				code : {
					required : true,
					pattern : /^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$/
				},
				file : {
					required : true,
					accept: "image/jpeg, image/png",
					filesize : 2321590,
				},
			},
			messages : {
				df_code : {
					pattern : "Only alphanumeric allow."
				},
			}
		});
		
	});
	/* extension: "jpg,jpeg", */
</script>
</html>
