<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@include file="datatableLib.jsp" %><!DOCTYPE html ><html><head><title>demoTable</title><link rel="stylesheet" href="../css/bootstrap.min.css"><link rel="stylesheet" href="../css/jquery.datetimepicker.min.css"><link rel="stylesheet" href="../css/forms.css"><!-- <script src="../js/jquery-3.2.1.min.js"></script> --><script src="../js/bootstrap.min.js"></script><script src="../js/jquery.datetimepicker.full.js"></script><script src="../js/formutility.js"></script><script src="../js/custom_alert.js"></script><script src="../js/bootstrap-show-password.min.js"></script><script src="../js/js-form-validator.min.js"></script><script src="../js/jquery.serializejson.js"></script><script> $(document).ready(function(){    $('[data-toggle="popover"]').popover();     $('body').tooltip({ selector: '[rel=tooltip]' });}); </script><style type="text/css"> label[id*="-error"] { color: red; } </style></head><body><a href='../index' class='glyphicon glyphicon-home btn-lg' style=' text-decoration:none; margin: 10px 20px; color: black;'></a><a  class='glyphicon glyphicon-question-sign btn-lg' href='#' title='Help' data-toggle='popover'  data-placement='left' data-trigger='focus' data-content='tttttt' style=' text-decoration:none;  position:absolute;  top:0; right:0; margin: 10px 20px; color: black;'></a><div class="container"><center><h2>demoTable</h2></center><form action="../insertForm/demoTable" id="iddemoTable" class="form-horizontal" method="post" ><div class="form-group"><label class="control-label col-sm-4">code</label><div class="col-sm-5"><input type="text"  class="form-control" name="code" id="code" tabindex="1" maxlength="10" title="code" rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="|Aplha_numeric" /></div></div><div class="form-group"><label class="control-label col-sm-4">pwd</label><div class="col-sm-5"><input type="password"  class="form-control" name="pwd" id="pwd" tabindex="2" maxlength="20" title="Please Enter"  rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="|Password" /><input type="checkbox" onclick="showPassword('pwd')" >Show Password</div></div><div class="form-group"><label class="control-label col-sm-4">Gender</label><div class="col-sm-5"> <div class='row'> <div class='col-sm-6'><input type="radio" name="gender" id="gender" tabindex="3" title="kgh"  rel="tooltip" data-toggle="tooltip" data-placement="right"  value="male"  />male<br /></div> <div class='col-sm-6'><input type="radio" name="gender" id="gender" tabindex="3" title="kgh"  rel="tooltip" data-toggle="tooltip" data-placement="right"  value="female"  />female<br /></div></div></div></div><div class="form-group"><label class="control-label col-sm-4">address</label><div class="col-sm-5"><textarea name="adr" id="adr"  class="form-control" placeholder="Enter text..." rows="5" cols="30" tabindex="4" maxlength="40" title="gh"  rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="|Address_Validation" ></textarea></div></div><div class="form-group"><label class="control-label col-sm-4">dob</label><div class="col-sm-5"><input type="text"  class="form-control" name="dob" id="dob" tabindex="11" onkeypress="return false;" readonly title="jhjgh"  rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="" /></div></div><div class="form-group"><label class="control-label col-sm-4">check in</label><div class="col-sm-5"><input type="text"  class="form-control" name="checkin" id="checkin" tabindex="12" onkeypress="return false;" readonly title="dfd"  rel="tooltip" data-toggle="tooltip" data-placement="right"  data-rule="" /></div></div><div class="form-group"><div class="col-sm-offset-4 col-sm-5"><input type="submit" class="btn btn-success" id="submitdemoTable" value="Submit" /></div></div></form><font color='red'><p id="errMessage"></p></font><c:if test="${not empty message}"><font color='green'><c:out value="${message }"></c:out></font></c:if><c:if test="${not empty errMessage}"><font color='red'> ${errMessage } </font></c:if></div><div class="container" style="overflow-x:auto;"><table id="tabledemoTable"><thead><tr><th>code</th><th>pwd</th><th>Gender</th><th>address</th><th>dob</th><th>check in</th><th>Edit</th><th>Delete</th></tr></thead></table></div><div id="dialogdemoTable" style="display: none"><form id="dialogformdemoTable" class="form-horizontal"><input type="hidden" id="formOption" value=""><input type="hidden" id="ID" value=""><div class="form-group"><label class="control-label col-sm-4">code</label><div class="col-sm-5"><input type="text"  class="form-control" name="code" id="df_code" tabindex=":tabindex" maxlength="10" title="" /></div></div><div class="form-group"><label class="control-label col-sm-4">pwd</label><div class="col-sm-5"><input type="password"  class="form-control" name="pwd" id="df_pwd" tabindex=":tabindex" maxlength="20" title=""  /><input type="checkbox" onclick="showPassword('df_pwd')" >Show Password<label id="df_pwd-error" class="error" for="df_pwd"></label></div></div><div class="form-group"><label class="control-label col-sm-4">Gender</label><div class="col-sm-5"> <div class='row'> <div class='col-sm-6'><input type="radio" name="gender" id="df_gender" tabindex=":tabindex" title=""  value="male"  />male<br /></div> <div class='col-sm-6'><input type="radio" name="gender" id="df_gender" tabindex=":tabindex" title=""  value="female"  />female<br /></div></div><label id="gender-error" class="error" for="gender"></label></div></div><div class="form-group"><label class="control-label col-sm-4">address</label><div class="col-sm-5"><textarea name="adr" id="df_adr"  class="form-control" placeholder="Enter text..." rows="5" cols="30" tabindex=":tabindex" maxlength="40" title=""  ></textarea></div></div><div class="form-group"><label class="control-label col-sm-4">dob</label><div class="col-sm-5"><input type="text"  class="form-control" name="dob" id="df_dob" tabindex=":tabindex" onkeypress="return false;" readonly title=""  /></div></div><div class="form-group"><label class="control-label col-sm-4">check in</label><div class="col-sm-5"><input type="text"  class="form-control" name="checkin" id="df_checkin" tabindex=":tabindex" onkeypress="return false;" readonly title=""  /></div></div></form></div><div id="formString" style="display: none;" ></body><script src="../js/formutility_date.js"></script><script>$(function(){ $('#submitdemoTable').click(function() {document.getElementById("errMessage").innerHTML = ""; return true; }); });</script><script>new Validator(document.querySelector('#iddemoTable'), function (err, res) {return res;},options = { rules : { Aplha_numeric: function(a){ return (new RegExp('^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$')).test(a) },Password: function(a){ return (new RegExp('(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\\S+$).{8,}')).test(a) },Address_Validation: function(a){ return (new RegExp('^[A-Za-z0-9,/-]{1,}$')).test(a) },},messages : { en : { Aplha_numeric:{ empty: "Only alphanumeric allow.", incorrect: "Only alphanumeric allow." },Password:{ empty: "Password must be, 2 Letter Capital,2 special char ,and any letter and any digit", incorrect: "Password must be, 2 Letter Capital,2 special char ,and any letter and any digit" },Address_Validation:{ empty: "Please enter proper address...", incorrect: "Please enter proper address..." },}}});</script><script>$('#df_dob').datetimepicker({timepicker:false,maxDate:'+1970/01/01',format: 'd.m.Y',formatDate : 'd.m.Y',});$('#df_checkin').datetimepicker({defaultDate:'17:08 01.01.2018',minDate:'17:08 01.01.2018',maxDate:'17:08 31.01.2018',format: 'H:i d.m.Y',formatDate: 'H:i d.m.Y',step : 1,});</script><script>var oTable = $('#tabledemoTable').DataTable({ "dom" : 'Blfrtip',  "buttons" : [ { text: 'Add', action: function ( e, dt, node, config ) { var validator = $('#dialogformdemoTable').validate(); document.getElementById('dialogformdemoTable').reset(); validator.resetForm(); $("#formOption").val("add"); $('#dialogdemoTable').dialog('open'); } } ], "columns":[{"data" : "code"},{"data" : "pwd"},{"data" : "gender"},{"data" : "adr"},{"data" : "dob"},{"data" : "checkin"},{ "data" : "edit" }, { "data" : "delete"	},], "processing" : true,  "serverSide" : true,  "paging": true,  "ajax" : {  "contentType": "application/json",  "data": function ( d ) { return JSON.stringify( d ); },  "url" : "../listForDatatable/demoTable",  "dataSrc" : "data",  "type" : "POST" } } ); function editRow(id)	{ var validator = $('#dialogformdemoTable').validate(); document.getElementById('dialogformdemoTable').reset(); validator.resetForm(); $("#ID").val(""); $("#formOption").val("edit"); document.getElementById("errMessage").innerHTML = ""; $.ajax({ type : "POST", url : "../restFatchDataFromID/demoTable", data : { "id" : id }, cache : false, success : function(result) { var jsonData = JSON.parse(result); if (jsonData['error']) { $.each(jsonData['error'],function(key,value) { document.getElementById("errMessage").innerHTML += "<font color='red'>"+ value+ "</font><br>";}); } else { $.each(jsonData, function(key, value) { { if (key == 'ID') { $("#ID").val(value); } if ($("#df_" + key).is(':radio')) { $("input[id=df_" + key + "][value=\"" + value + "\"]").prop('checked', true); } else if ($("#df_" + key).is(':checkbox')) { $("input[id=df_" + key + "][value=\"" + value + "\"]").prop('checked', true); } else { $("#df_" + key).val(value); } } }); $('#dialogdemoTable').dialog('open'); } }, error : function(XMLHttpRequest,textStatus,errorThrown) { document.getElementById("errMessage").innerHTML = "<font color='red'>Problem in fatching data.</font>"; } }); }function deleteRow(id) {	var value = confirm("Are you sure want to delete this record?"); if(value == true) { document.getElementById("errMessage").innerHTML = "";$.ajax({ type : "POST", url : "../delete/demoTable", data: "{\"ID\":"+id+"}", contentType: "application/json; charset=utf-8", dataType: "json", cache: false, success : function(result) { if(result['error']) { $.each(result['error'], function(key, value) { document.getElementById("errMessage").innerHTML += "<font color='red'>"+value+"</font><br>"; }); } else if(result['success']) { $.each(result['success'], function(key, value) { document.getElementById("errMessage").innerHTML += "<font color='green'>"+value+"</font><br>"; }); oTable.rows().remove().draw(); oTable.draw(); } }, error: function(XMLHttpRequest, textStatus, errorThrown) { document.getElementById("errMessage").innerHTML = "<font color='red'>Record deletion failed.</font>"; } });  /*$('#tabledemoTable').DataTable().draw(); */  } }</script><script>$(function() { $('#dialogdemoTable').dialog({autoOpen : false,title:'demoTable',height: 500,width: 550,buttons : { 'Send' : function() { if ($('#dialogformdemoTable').valid()) { var ajaxUrl = ""; var jsonData = JSON.stringify($('#dialogformdemoTable').serializeJSON()); if($("#formOption").val() == "add") { ajaxUrl = "../insert/demoTable"; } else if ($("#formOption").val() == "edit") { ajaxUrl = "../update/demoTable"; jsonData = jsonData.substring(0, jsonData.length-1) + ",\"ID\":\""+$("#ID").val()+"\"}"; } else { ajaxUrl = ""; } $('#dialogdemoTable').dialog('close');$.ajax({	type : "POST", url : ajaxUrl, data: jsonData, contentType: "application/json; charset=utf-8", dataType: "json", cache: false, success : function(result) { if(result['error']) { console.log(result['error']); $.each(result['error'], function(key, value) { console.log(value); document.getElementById("errMessage").innerHTML = ""; document.getElementById("errMessage").innerHTML += "<font color='red'>"+value+"</font><br>"; }); } else if(result['success']) { console.log(result['success']); $.each(result['success'], function(key, value) { console.log(value); document.getElementById("errMessage").innerHTML = ""; document.getElementById("errMessage").innerHTML += "<font color='green'>"+value+"</font><br>"; });  /*$('#tabledemoTable').DataTable().draw();*/  /*oTable.ajax.reload();*/  oTable.rows().remove().draw(); oTable.rows.add(result); oTable.draw(); } }, error: function(XMLHttpRequest, textStatus, errorThrown) { document.getElementById("errMessage").innerHTML = "<font color='red'>Record insertion failed.</font>"; } });  } } } });$('#dialogformdemoTable').validate({rules : {code:{ pattern: /^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$/ },pwd:{ pattern: /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\S+$).{8,}/ },adr:{ pattern: /^[A-Za-z0-9,/-]{1,}$/ },}, messages: {df_code:{pattern: "Only alphanumeric allow." },df_pwd:{pattern: "Password must be, 2 Letter Capital,2 special char ,and any letter and any digit" },df_adr:{pattern: "Please enter proper address..." },} }); }); </script></html>