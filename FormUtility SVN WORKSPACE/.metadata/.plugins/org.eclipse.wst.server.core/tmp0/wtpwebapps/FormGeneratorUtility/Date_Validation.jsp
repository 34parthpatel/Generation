<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@include file="datatableLib.jsp" %><!DOCTYPE html ><html><head><title>date_validation</title><link rel="stylesheet" href="../css/bootstrap.min.css"><link rel="stylesheet" href="../css/jquery.datetimepicker.min.css"><link rel="stylesheet" href="../css/forms.css"><!-- <script src="../js/jquery-3.2.1.min.js"></script> --><script src="../js/bootstrap.min.js"></script><script src="../js/jquery.datetimepicker.full.js"></script><script src="../js/formutility.js"></script><script src="../js/custom_alert.js"></script><script src="../js/bootstrap-show-password.min.js"></script><script src="../js/js-form-validator.min.js"></script><script src="../js/jquery.serializejson.js"></script><script> $(document).ready(function(){    $('[data-toggle="popover"]').popover();     $('body').tooltip({ selector: '[rel=tooltip]' });}); </script><style type="text/css"> label[id*="-error"] { color: red; } </style></head><body><a href='../index' class='glyphicon glyphicon-home btn-lg' style=' text-decoration:none; margin: 10px 20px; color: black;'></a><a  class='glyphicon glyphicon-question-sign btn-lg' href='#' title='Help' data-toggle='popover'  data-placement='left' data-trigger='focus' data-content='help date validation' style=' text-decoration:none;  position:absolute;  top:0; right:0; margin: 10px 20px; color: black;'></a><div class="container"><center><h2>date_validation</h2></center><form action="../insertForm/date_validation" id="iddate_validation" class="form-horizontal" method="post" enctype="multipart/form-data" ><div class="form-group"><label class="control-label col-sm-4">date</label><div class="col-sm-5"><input type="text"  class="form-control" name="date1" id="date1" tabindex="1" onkeypress="return false;" readonly title="date"  rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="required" /></div></div><div class="form-group"><label class="control-label col-sm-4">datetime</label><div class="col-sm-5"><input type="text"  class="form-control" name="datetime1" id="datetime1" tabindex="2" onkeypress="return false;" readonly title="datetime"  rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="required" /></div></div><div class="form-group"><div class="col-sm-offset-4 col-sm-5"><input type="submit" class="btn btn-success" id="submitdate_validation" value="Submit" /><input type='button' class='btn Info' id='search' onclick='loadDataTable()'	value='Search' /></div></div></form><font color='red'><p id="errMessage"></p></font><c:if test="${not empty message}"><font color='green'><c:out value="${message }"></c:out></font></c:if><c:if test="${not empty errMessage}"><font color='red'> ${errMessage } </font></c:if></div><div class="container" style="overflow-x:auto;"><table id="tabledate_validation"><thead><tr><th>date</th><th>datetime</th><th>Edit</th><th>Delete</th></tr></thead><tfoot><tr><th>date</th><th>datetime</th><th>Edit</th><th>Delete</th></tr></tfoot></table></div><div id="dialogdate_validation" style="display: none"><form id="dialogformdate_validation" class="form-horizontal"><input type="hidden" id="formOption" value=""><input type="hidden" id="ID" value=""><div class="form-group"><label class="control-label col-sm-4">date</label><div class="col-sm-5"><input type="text"  class="form-control" name="date1" id="df_date1" tabindex=":tabindex" onkeypress="return false;" readonly title=""  /></div></div><div class="form-group"><label class="control-label col-sm-4">datetime</label><div class="col-sm-5"><input type="text"  class="form-control" name="datetime1" id="df_datetime1" tabindex=":tabindex" onkeypress="return false;" readonly title=""  /></div></div></form></div></body><script src="../js/formutility_date.js"></script><script> var returnType = true; var errMessage = ""; $(function(){ $('#submitdate_validation').click(function() {document.getElementById("errMessage").innerHTML = ""; return returnType; }); });function checkFile(id) { checkFileType(id); }</script><script>new Validator(document.querySelector('#iddate_validation'), function (err, res) {return res;},options = { rules : { },messages : { en : { }}});</script><script>$('#df_date1').datetimepicker({timepicker:false,defaultDate:'2018-02-06',minDate:'2018-02-06',maxDate:'2018-02-15',format: 'Y-m-d',formatDate : 'Y-m-d',});$('#df_datetime1').datetimepicker({defaultDate:'2018-02-05 17:41',minDate:'2018-02-05 17:41',maxDate:'2018-02-24 17:41',format: 'Y-m-d H:i',formatDate: 'Y-m-d H:i',step : 1,});</script><script>var oTable = $('#tabledate_validation').dataTable({ "dom" : 'Blfrtip',  "buttons" : [ { text: 'Add', action: function ( e, dt, node, config ) { var validator = $('#dialogformdate_validation').validate(); document.getElementById('dialogformdate_validation').reset(); validator.resetForm(); $("#formOption").val("add"); $('#dialogdate_validation').dialog('open'); } } ], "columns":[{"data" : "date1"},{"data" : "datetime1"},{ "data" : "edit" }, { "data" : "delete"	},],"columnDefs": [ { orderable: false, targets: [-1,-2] } ], "processing" : true,  "serverSide" : true,  "paging": true,  "ajax" : {  "contentType": "application/json",  "data": function ( d ) { return JSON.stringify( d ); },  "url" : "../listForDatatable/date_validation",  "dataSrc" : "data",  "type" : "POST" } } ); $('#tabledate_validation_filter input').unbind();$('#tabledate_validation_filter input').bind('keyup', function(e) {  if(e.keyCode == 13) {    oTable.fnFilter(this.value); 	} 	else if(!this.value.trim()) { oTable.fnFilter(this.value); 	}  });$('#tabledate_validation tfoot th').each( function () {      var title = $(this).text(); $(this).html( '<input type="text" placeholder="Search '+title+'" />' );  } );  oTable.api().columns().every( function () {  var that = this;    $( 'input', this.footer() ).on( 'keyup change', function (e) { 	   if(e.keyCode == 13) { 	     that.search( this.value).draw(); 	   }   });  });function editRow(id)	{ var validator = $('#dialogformdate_validation').validate(); document.getElementById('dialogformdate_validation').reset(); validator.resetForm(); $("#ID").val(""); $("#formOption").val("edit"); document.getElementById("errMessage").innerHTML = ""; $.ajax({ type : "POST", url : "../restFatchDataFromID/date_validation", data : { "id" : id }, cache : false, success : function(result) { var jsonData = JSON.parse(result); if (jsonData['error']) { $.each(jsonData['error'],function(key,value) { document.getElementById("errMessage").innerHTML += "<font color='red'>"+ value+ "</font><br>";}); } else { $.each(jsonData, function(key, value) { { if (key == 'ID') { $("#ID").val(value); } if ($("#df_" + key).is(':radio')) { $("input[id=df_" + key + "][value=\"" + value + "\"]").prop('checked', true); } else if ($("#df_" + key).is(':checkbox')) { if (value.indexOf(',') > -1) { var array = value.split(','); for(var i=0;i<array.length;i++) { $("input[id=df_" + key + "][value=\"" + array[i] + "\"]").prop('checked', true); } } else { $("input[id=df_" + key + "][value=\"" + value + "\"]").prop('checked', true); }  } else { $("#df_" + key).val(value); } } }); $('#dialogdate_validation').dialog('open'); } }, error : function(XMLHttpRequest,textStatus,errorThrown) { document.getElementById("errMessage").innerHTML = "<font color='red'>Problem in fatching data.</font>"; } }); }function deleteRow(id) {	var value = confirm("Are you sure want to delete this record?"); if(value == true) { document.getElementById("errMessage").innerHTML = "";$.ajax({ type : "POST", url : "../delete/date_validation", data: "{\"ID\":"+id+"}", contentType: "application/json; charset=utf-8", dataType: "json", cache: false, success : function(result) { if(result['error']) { $.each(result['error'], function(key, value) { document.getElementById("errMessage").innerHTML += "<font color='red'>"+value+"</font><br>"; }); } else if(result['success']) { $.each(result['success'], function(key, value) { document.getElementById("errMessage").innerHTML += "<font color='green'>"+value+"</font><br>"; }); oTable.api().rows().remove().draw(); oTable.api().draw(); } }, error: function(XMLHttpRequest, textStatus, errorThrown) { document.getElementById("errMessage").innerHTML = "<font color='red'>Record deletion failed.</font>"; } });  /*$('#tabledate_validation').DataTable().draw(); */  } }</script><script>$(function() { $('#dialogdate_validation').dialog({autoOpen : false,title:'date_validation',height: 500,width: 550,buttons : { 'Send' : function() { if ($('#dialogformdate_validation').valid()) { var ajaxUrl = ""; var jsonData = JSON.stringify($('#dialogformdate_validation').serializeJSON()); if($("#formOption").val() == "add") { ajaxUrl = "../insert/date_validation"; } else if ($("#formOption").val() == "edit") { ajaxUrl = "../update/date_validation"; jsonData = jsonData.substring(0, jsonData.length-1) + ",\"ID\":\""+$("#ID").val()+"\"}"; } else { ajaxUrl = ""; } $('#dialogdate_validation').dialog('close');$.ajax({	type : "POST", url : ajaxUrl, data: jsonData, contentType: "application/json; charset=utf-8", dataType: "json", cache: false, success : function(result) { if(result['error']) { console.log(result['error']); $.each(result['error'], function(key, value) { console.log(value); document.getElementById("errMessage").innerHTML = ""; document.getElementById("errMessage").innerHTML += "<font color='red'>"+value+"</font><br>"; }); } else if(result['success']) { console.log(result['success']); $.each(result['success'], function(key, value) { console.log(value); document.getElementById("errMessage").innerHTML = ""; document.getElementById("errMessage").innerHTML += "<font color='green'>"+value+"</font><br>"; });  /*$('#tabledate_validation').DataTable().draw();*/  /*oTable.ajax.reload();*/  oTable.api().rows().remove().draw(); oTable.api().rows.add(result); oTable.api().draw(); } }, error: function(XMLHttpRequest, textStatus, errorThrown) { document.getElementById("errMessage").innerHTML = "<font color='red'>Record insertion failed.</font>"; } });  } } } });$('#dialogformdate_validation').validate({rules : {date1:{ required: true },datetime1:{ required: true },}, messages: {date1:{ required: "date is required" },datetime1:{ required: "datetime is required" },} }); }); </script></html>