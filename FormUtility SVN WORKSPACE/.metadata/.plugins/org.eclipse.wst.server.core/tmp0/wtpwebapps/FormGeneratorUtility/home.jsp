<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Generator Utility</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.datetimepicker.min.css">
<!-- <link rel="stylesheet" href="css/validation.min.css"> -->
<link rel="stylesheet" href="css/forms.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.datetimepicker.full.js"></script>
<script src="js/formutility.js"></script>
<!-- <script src="js/validation.min.js"></script> -->
<script src="js/js-form-validator.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script>
$(document).ready(function(){
    $('body').tooltip({
    	selector: '[rel=tooltip]'
    });
    /* $("input").blur(function(){
    	validateJs.hideErrors();
    }); */
    
	/* $('#myTable').DataTable(); */
	
	$("#submitForm").click(function(){
		//alert($("#required1").val());
		/* var i=1;
		$('input[name="required"]').each(function() {
			alert($(this).val().trim());
		    if($(this).val().trim() == "")
		    {
		    	$("#errMsg").text("Please select validation on row "+i);
		    	return false;
		    }
		    i++;
		}); */
		var counter = $('[id^=tbl_tr]').length;
		//alert(counter);
		for(var i=1;i<=counter;i++) {
			//alert($("#required"+i).val());
			if($("#fld_ctrl"+i).val()!="alert" &&  $("#fld_ctrl"+i).val()!="hyperlink") {
				if($("#required"+i).val() == "")
				{
					//$("#required1").val("Please select");
					$("#errMsg").text("Please select validation on row "+inWords(i).toUpperCase());
					return false;
				}
			}
			
		}
		$("#errMsg").text("");
		//return true;
	})
	
	$("#clear").click(function(){
		document.getElementById("tableGenerationForm").reset();
		validateJs.reload();
	})
});
</script>

<script>
$(document).ready(function(){
	var counter = 2;
	$("#htmlRegexPatternsForTextModule").val("${htmlRegexPatternsForTextModule }");
	$("#htmlRegexPatternsForPasswordModule").val("${htmlRegexPatternsForPasswordModule }");
	$("#htmlRegexPatternsForNumberModule").val("${htmlRegexPatternsForNumberModule}");

	/* $("select").on('change', function() {
		var count = $('[id^=tbl_tr]').length;
		alert(count);
		var temp = $("#fld_ctrl"+count).val();
		alert( temp );
	}) */
	
    $("#addFields").click(function () {
    	
    	var newTextBoxDiv = $(document.createElement('tr'))
		     .attr("id", 'tbl_tr'+counter);
		newTextBoxDiv.after().html('<td><select class="form-control temp" name="fld_ctrl" id="fld_ctrl'+counter+'" onchange="getFldCtrl(\'tbl_tr'+counter+'\',\'fld_ctrl'+counter+'\')" >' +
				'<option value="textbox">TextBox</option>' +
				'<option value="password">Password</option>' +
				'<option value="textarea">TextArea</option>' +
				'<option value="radio">Radio Button</option>' +
				'<option value="checkBox">Check Box</option>' +
				'<option value="comboBox">Select</option>' +
				'<option value="date">Date</option>' +
				'<option value="number">Number</option>' +
				'<option value="alert">Custom Popup</option>' +
				'<option value="hyperlink">Hyperlink</option>'+
				'<option value="file">File</option>'+
				'</select></td>' +
				'<td><select class="form-control" name="fld_type" id="fld_type">' +
				'<option value="INT">INT</option>' +
				'<option value="CHAR">CHAR</option>' +
				'<option value="VARCHAR">VARCHAR</option>' +
				'</select></td>' +
				'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+counter+'"  /></td>' +
				'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+counter+'"  /></td>' +
				'<td><input type="text" class="form-control" data-rule="required|fieldSize|between-1-250" name="fld_size" id="fld_size'+counter+'"  /></td>' +
				'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+counter+'" size="1" min="1" max="100"  /></td>' +
				'<td><select class="form-control" name="validation" id="validation'+counter+'" data-rule="regex" onChange="onRegexChange(\'validation'+counter+'\')" >' +
				'<option value="Please select" selected>Please select</option>' +
				'<option value="TextModule">Text Module</option>' +
				'<option value="Custom">Custom</option>' +
				'</select></td>' +
				'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+counter+'" /></td>' +
				'<td><textarea class="form-control" rows="2" cols="22" name="fld_val" id="fld_val'+counter+'" style="display: none;" ></textarea>' +
				'<input type="text" class="form-control" name="date_all" id="date_all'+counter+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="date_past" id="date_past'+counter+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="date_future" id="date_future'+counter+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="start_date" id="start_date_id'+counter+'" style="display: none;" />' + 
				'<input type="text" class="form-control" name="end_date" id="end_date_id'+counter+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="date_format" id="date_format'+counter+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="regex" id="regex'+counter+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="required" id="required'+counter+'" style="display: none;" /></td></tr>');
		newTextBoxDiv.appendTo("#table_fields");
		counter++;
    });
    
    $("#delFields").click(function () {
    	var count = $('[id^=tbl_tr]').length;
    	if(count == 1)
    	{
    		alert("You Can Not Delete Parent Row!");
			return false;
    	}
    	else
    	{
    		counter--;
    		$("#tbl_tr"+counter).remove();
    	}
    });
    
    
});
</script>

<script type="text/javascript">
	
	function getFldCtrl(rowId,ctrlId)
	{
		//var idNo = rowId.charAt(rowId.length-1);
		var counter = $('[id^=tbl_tr]').length;
		var dateCnt = rowId.substring(6, rowId.length);
		var val = $("#"+ctrlId).val();
		if(val == 'radio')
		{
			//alert("Enter comma separated values in Field Size!");
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio" selected>Radio Button</option>' +
					'<option value="checkBox">Check Box</option>' +
					'<option value="comboBox">Select</option>' +
					'<option value="date">Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert">Custom Popup</option>' +
					'<option value="hyperlink">Hyperlink</option>'+
					'<option value="file">File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="INT">INT</option>' +
					'<option value="FLOAT">FLOAT</option>' +
					'<option value="CHAR">CHAR</option>' +
					'<option value="VARCHAR" selected>VARCHAR</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel"  name="fld_lbl" id="fld_lbl'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+dateCnt+'"  /></td>' +
					'<td><textarea rows="2" class="form-control txt_area_val" data-rule="required|minlength-5" cols="22" name="fld_val" id="fld_val'+dateCnt+'" placeholder="Enter values..." rel="tooltip" data-toggle="tooltip" title="Enter comma separated values here!"  ></textarea></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
					'<option value="Please select" selected>Please select</option>' +
					'<option value="RadioModule">Radio Module</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					/* "<td><select class='form-control' name='regex' id='regex"+dateCnt+"' data-rule='regex' onChange='onRegexChange(\"regex"+dateCnt+"\")'>" + "${htmlRegexPatternsForRadioModule}" + "</select></td>"+ */
					'<td><input type="hidden" name="fld_size" id="fld_size'+dateCnt+'" />' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
			
			document.getElementById(rowId).innerHTML = idHtml;
		}
		else if(val == 'checkBox')
		{
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio">Radio Button</option>' +
					'<option value="checkBox" selected>Check Box</option>' +
					'<option value="comboBox">Select</option>' +
					'<option value="date">Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert">Custom Popup</option>' +
					'<option value="hyperlink">Hyperlink</option>'+
					'<option value="file">File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="CHAR">CHAR</option>' +
					'<option value="VARCHAR">VARCHAR</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+dateCnt+'"  /></td>' +
					'<td><textarea rows="2" class="form-control txt_area_val" data-rule="required|minlength-5" cols="22" name="fld_val" id="fld_val'+dateCnt+'" placeholder="Enter values..." rel="tooltip" data-toggle="tooltip" title="Enter comma separated values here!"  ></textarea></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
					'<option value="Please select" selected>Please select</option>' +
					'<option value="CheckboxModule">Checkbox Module</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					/* "<td><select class='form-control' name='regex' id='regex"+dateCnt+"' data-rule='regex' onChange='onRegexChange(\"regex"+dateCnt+"\")'>" + "${htmlRegexPatternsForCheckboxModule}" + "</select></td>"+ */
					'<td><input type="hidden" name="fld_size" id="fld_size'+dateCnt+'" />' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
			
			document.getElementById(rowId).innerHTML = idHtml;
		}
		else if(val == 'comboBox')
		{
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio">Radio Button</option>' +
					'<option value="checkBox">Check Box</option>' +
					'<option value="comboBox" selected>Select</option>' +
					'<option value="date">Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert">Custom Popup</option>' +
					'<option value="hyperlink">Hyperlink</option>'+
					'<option value="file">File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="INT">INT</option>' +
					'<option value="FLOAT">FLOAT</option>' +
					'<option value="CHAR">CHAR</option>' +
					'<option value="VARCHAR" selected>VARCHAR</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+dateCnt+'"  /></td>' +
					'<td><textarea rows="2" class="form-control txt_area_val" data-rule="required|minlength-5" cols="22" name="fld_val" id="fld_val'+dateCnt+'" placeholder="Enter values..." rel="tooltip" data-toggle="tooltip" title="Enter comma separated values here!"  ></textarea></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
					'<option value="Please select" selected>Please select</option>' +
					'<option value="SelectModule">Select Module</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					//"<td><select class='form-control' name='regex' id='regex"+dateCnt+"' data-rule='regex' onChange='onRegexChange(\"regex"+dateCnt+"\")'>" + "${htmlRegexPatternsForSelectModule}" + "</select></td>"+
					'<td><input type="hidden" name="fld_size" id="fld_size'+dateCnt+'" />' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
			
			document.getElementById(rowId).innerHTML = idHtml;
		}

		else if(val == 'date')
		{
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio">Radio Button</option>' +
					'<option value="checkBox">Check Box</option>' +
					'<option value="comboBox">Select</option>' +
					'<option value="date" selected>Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert">Custom Popup</option>' +
					'<option value="hyperlink">Hyperlink</option>'+
					'<option value="file">File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="DATE">DATE</option>' +
					'<option value="DATETIME">DATETIME</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" name="fld_size" id="fld_size'+dateCnt+'" value="0" readonly /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
					'<option value="Please select" selected>Please select</option>' +
					'<option value="Date Validation">Date Validation</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					//"<td><select class='form-control' name='regex' id='regex"+dateCnt+"' data-rule='regex' onChange='onRegexChange(\"regex"+dateCnt+"\")'>" + "${htmlRegexPatternsForDateModule}" + "</select></td>" +
					'<td><textarea rows="2" cols="22" name="fld_val" id="fld_val'+dateCnt+'" style="display: none;" ></textarea>' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
	
			document.getElementById(rowId).innerHTML = idHtml;
		}

		else if(val == 'alert')
		{
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio">Radio Button</option>' +
					'<option value="checkBox">Check Box</option>' +
					'<option value="comboBox">Select</option>' +
					'<option value="date">Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert" selected>Custom Popup</option>' +
					'<option value="hyperlink">Hyperlink</option>'+
					'<option value="file">File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="Custom">Custom</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'" rel="tooltip" data-toggle="tooltip" title="Alert Title	"  /></td>' +
					'<td><textarea rows="2" class="form-control txt_area_val" data-rule="required|minlength-5" cols="22" name="fld_name" id="fld_name'+dateCnt+'" rel="tooltip" data-toggle="tooltip" title="Alert Discription"  ></textarea></td>' +
					'<td><textarea rows="2" class="form-control txt_area_val" data-rule="required|minlength-5" cols="22" name="fld_val" id="fld_val'+dateCnt+'" placeholder="Enter values..." rel="tooltip" data-toggle="tooltip" title="Enter comma separated Button name at here."  ></textarea></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="regex" id="regex"><option value="No validation" selected>No validation</option></select></td>'+
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					'<td><input type="hidden" name="fld_size" id="fld_size'+dateCnt+'" />' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					/* '<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' + */
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
					
			document.getElementById(rowId).innerHTML = idHtml;
		}
		else if(val == 'hyperlink')
		{
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio">Radio Button</option>' +
					'<option value="checkBox">Check Box</option>' +
					'<option value="comboBox">Select</option>' +
					'<option value="date">Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert" >Custom Popup</option>' +
					'<option value="hyperlink" selected>Hyperlink</option>'+
					'<option value="file">File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="Link">Link</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'" rel="tooltip" data-toggle="tooltip" title="Hyperlink Text"  /></td>' +
					'<td><textarea rows="2" cols="22" class="form-control txt_area_val" data-rule="required|minlength-5" name="fld_val" id="fld_val'+dateCnt+'" rel="tooltip" data-toggle="tooltip" title="Hyperlink URL"  ></textarea></td>' +
					'<td><input type="text" class="form-control" name="fld_size" id="fld_size'+dateCnt+'" readonly="true" value="0"/></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="regex" id="regex"><option value="No validation" selected>No validation</option</select></td>'+
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					'<td><input type="text" name="fld_name" id="fld_name'+dateCnt+'" value="hyperlink'+dateCnt+'" style="display: none;" />'+
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					/* '<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' + */
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
					
					document.getElementById(rowId).innerHTML = idHtml;
		}
		else if(val == 'textarea')
		{
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
				'<option value="textbox">TextBox</option>' +
				'<option value="password">Password</option>' +
				'<option value="textarea" selected>TextArea</option>' +
				'<option value="radio">Radio Button</option>' +
				'<option value="checkBox">Check Box</option>' +
				'<option value="comboBox">Select</option>' +
				'<option value="date">Date</option>' +
				'<option value="number">Number</option>'+
				'<option value="alert">Custom Popup</option>'+
				'<option value="hyperlink">Hyperlink</option>' +
				'<option value="file">File</option>'+
				'</select></td>' +
				'<td><select class="form-control" name="fld_type" id="fld_type">' +
				'<option value="VARCHAR">VARCHAR</option>' +
				'</select></td>' +
				'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'"  /></td>' +
				'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+dateCnt+'" /></td>' +
				'<td><input type="text" class="form-control" data-rule="required|fieldSize|between-1-400" name="fld_size" id="fld_size'+dateCnt+'"  /></td>' +
				'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
				'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
				'<option value="Please select" selected>Please select</option>' +
				'<option value="TextModule">Text Module</option>' +
				'<option value="Custom">Custom</option>' +
				'</select></td>' +
				'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
				//"<td><select class='form-control' name='regex' id='regex"+dateCnt+"' data-rule='regex' onChange='onRegexChange(\"regex"+dateCnt+"\")'>" +$("#htmlRegexPatternsForTextModule").val() + "</select></td>"+
				'<td><textarea rows="2" cols="22" name="fld_val" id="fld_val'+dateCnt+'" style="display: none;" ></textarea>' +
				'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
				'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
				'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
		
				document.getElementById(rowId).innerHTML = idHtml;
		}
		else if(val == 'file')
		{
			//alert("Enter comma separated values in Field Size!");
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					'<option value="textbox">TextBox</option>' +
					'<option value="password">Password</option>' +
					'<option value="textarea">TextArea</option>' +
					'<option value="radio">Radio Button</option>' +
					'<option value="checkBox">Check Box</option>' +
					'<option value="comboBox">Select</option>' +
					'<option value="date">Date</option>' +
					'<option value="number">Number</option>' +
					'<option value="alert">Custom Popup</option>' +
					'<option value="hyperlink">Hyperlink</option>'+
					'<option value="file" selected>File</option>'+
					'</select></td>' +
					'<td><select class="form-control" name="fld_type" id="fld_type">' +
					'<option value="VARCHAR">VARCHAR</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'" /></td>' +
					'<td><input type="text" class="form-control" name="fld_name" id="fld_name'+dateCnt+'" /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldSize" name="fld_size" id="fld_size'+dateCnt+'" placeholder="Please enter size in KiloByte" rel="tooltip" data-toggle="tooltip" title="Please enter size in KiloByte" /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
					'<option value="Please select" selected>Please select</option>' +
					'<option value="FileModule">File Module</option>' +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					'<td><textarea rows="2" cols="22" name="fld_val" id="fld_val'+dateCnt+'" style="display: none;" ></textarea>' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
			
			document.getElementById(rowId).innerHTML = idHtml;
		}
		else
		{
			var str = "";
			var fieldTypes = '<select class="form-control" name="fld_type" id="fld_type">' +
			'<option value="INT">INT</option>' +
			'<option value="CHAR">CHAR</option>' +
			'<option value="VARCHAR">VARCHAR</option>' +
			'</select>';
			var regEx="";
			if(val == 'textbox')
			{
				str = '<option value="textbox" selected>TextBox</option>' +
				'<option value="password">Password</option>' +
				'<option value="textarea">TextArea</option>' +
				'<option value="radio">Radio Button</option>' +
				'<option value="checkBox">Check Box</option>' +
				'<option value="comboBox">Select</option>' +
				'<option value="date">Date</option>' +
				'<option value="number">Number</option>'+
				'<option value="alert">Custom Popup</option>'+
				'<option value="hyperlink">Hyperlink</option>' +
				'<option value="file">File</option>';
				//regEx =  $("#htmlRegexPatternsForTextModule").val() ;
				regEx = '<option value="TextModule">Text Module</option>' +
				'<option value="Custom">Custom</option>';
				
			}
			else if(val == 'password')
			{
				str = '<option value="textbox">TextBox</option>' +
				'<option value="password" selected>Password</option>' +
				'<option value="textarea">TextArea</option>' +
				'<option value="radio">Radio Button</option>' +
				'<option value="checkBox">Check Box</option>' +
				'<option value="comboBox">Select</option>' +
				'<option value="date">Date</option>' +
				'<option value="number">Number</option>'+
				'<option value="alert">Custom Popup</option>' +
				'<option value="hyperlink">Hyperlink</option>' +
				'<option value="file">File</option>';
				fieldTypes = '<select class="form-control" name="fld_type" id="fld_type">' +
				'<option value="VARCHAR">VARCHAR</option>' +
				'</select>';
				//regEx =  $("#htmlRegexPatternsForPasswordModule").val() ;
				regEx = '<option value="PasswordModule">Password Module</option>' +
				'<option value="Custom">Custom</option>';
			}
			else
			{
				str = '<option value="textbox">TextBox</option>' +
				'<option value="password">Password</option>' +
				'<option value="textarea">TextArea</option>' +
				'<option value="radio">Radio Button</option>' +
				'<option value="checkBox">Check Box</option>' +
				'<option value="comboBox">Select</option>' +
				'<option value="date">Date</option>' +
				'<option value="number" selected>Number</option>'+
				'<option value="alert">Custom Popup</option>' +
				'<option value="hyperlink">Hyperlink</option>' +
				'<option value="file">File</option>';
				fieldTypes = '<select class="form-control" name="fld_type" id="fld_type">' +
				'<option value="INT">INT</option>' +
				'<option value="FLOAT">FLOAT</option>' +
				'<option value="DOUBLE">DOUBLE</option>' +
				'<option value="NUMERIC">NUMERIC</option>' +
				'</select>';
				//regEx =  $("#htmlRegexPatternsForNumberModule").val() ;
				regEx = '<option value="NumberModule">Number Module</option>' +
				'<option value="Custom">Custom</option>';
				//htmlRegexPatternsForNumberModule
			}
			
			var idHtml = '<tr id="'+rowId+'"><td><select class="form-control temp" name="fld_ctrl" id="'+ctrlId+'" onchange="getFldCtrl(\''+rowId+'\',\''+ctrlId+'\')" >' +
					str +
					'</select></td>' +
					'<td>' +
					fieldTypes +
					'</td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldName" name="fld_name" id="fld_name'+dateCnt+'" /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|fieldSize|between-1-250" name="fld_size" id="fld_size'+dateCnt+'"  /></td>' +
					'<td><input type="text" class="form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index'+dateCnt+'" size="1" min="1" max="100"  /></td>' +
					'<td><select class="form-control" name="validation" id="validation'+dateCnt+'" data-rule="regex" onChange="onRegexChange(\'validation'+dateCnt+'\')" >' +
					'<option value="Please select" selected>Please select</option>' +
					regEx +
					'</select></td>' +
					'<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip'+dateCnt+'" /></td>' +
					//"<td><select class='form-control' name='regex' id='regex"+dateCnt+"' data-rule='regex' onChange='onRegexChange(\"regex"+dateCnt+"\")'>" +regEx + "</select></td>"+
					'<td><textarea rows="2" cols="22" name="fld_val" id="fld_val'+dateCnt+'" style="display: none;" ></textarea>' +
					'<input type="text" class="form-control" name="date_all" id="date_all'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_past" id="date_past'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_future" id="date_future'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="start_date" id="start_date_id'+dateCnt+'" style="display: none;" />' + 
					'<input type="text" class="form-control" name="end_date" id="end_date_id'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="date_format" id="date_format'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="regex" id="regex'+dateCnt+'" style="display: none;" />' +
					'<input type="text" class="form-control" name="required" id="required'+dateCnt+'" style="display: none;" /></td></tr>';
			
			document.getElementById(rowId).innerHTML = idHtml;
		}
		
	}
	
	/* function onDateValidationChange(value)
	{
		var val = $("#"+value).val();
		if(val == 'RANGE')
		{
			$("#tempDateId").val(value);
			$("#dateRangeModal").modal();
		}
		else if(val == 'FORMAT')
		{
			$("#tempDateFormatId").val(value);
			$("#dateFormatModal").modal();
		}
	} */
	
	function onRegexChange(id)
	{
		var val = $("#"+id).val();
		//alert(val);
		if(val == "TextModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","");
			$("#modulevalidation").html($("#htmlRegexPatternsForTextModule").val());
			$("#fileModulevalidationDiv").css("display","none");
			$("#mimeTypeDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'" + ($("#regex"+no).val()!=""));
			if($("#regex"+no).val()!="") {
				$("#modulevalidation").val($("#regex"+no).val());
			}
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			//alert(id);
			$("#moduleValidationModal").modal();
		}
		else if(val == "PasswordModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","");
			$("#modulevalidation").html($("#htmlRegexPatternsForPasswordModule").val());
			$("#fileModulevalidationDiv").css("display","none");
			$("#mimeTypeDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'" + ($("#regex"+no).val()!=""));
			if($("#regex"+no).val()!="") {
				$("#modulevalidation").val($("#regex"+no).val());
			}
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			$("#moduleValidationModal").modal();
		}
		else if(val == "RadioModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","none");
			$("#modulevalidation").val("");
			$("#fileModulevalidationDiv").css("display","none");
			$("#mimeTypeDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'" + ($("#regex"+no).val()!=""));
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			$("#moduleValidationModal").modal();
		}
		else if(val == "CheckboxModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","none");
			$("#modulevalidation").val("");
			$("#fileModulevalidationDiv").css("display","none");
			$("#mimeTypeDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'" + ($("#regex"+no).val()!=""));
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			$("#moduleValidationModal").modal();
		}
		else if(val == "SelectModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","none");
			$("#modulevalidation").val("");
			$("#fileModulevalidationDiv").css("display","none");
			$("#mimeTypeDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'" + ($("#regex"+no).val()!=""));
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			$("#moduleValidationModal").modal();
		}
		else if(val == "NumberModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","");
			$("#modulevalidation").html($("#htmlRegexPatternsForNumberModule").val());
			$("#fileModulevalidationDiv").css("display","none");
			$("#mimeTypeDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'" + ($("#regex"+no).val()!=""));
			if($("#regex"+no).val()!="") {
				$("#modulevalidation").val($("#regex"+no).val());
			}
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			$("#moduleValidationModal").modal();
		}
		else if(val == "Custom"){
			$("#regexId").val(id);
			$("#cutomPatternModal").modal();
		}
		else if(val == "Date Validation")
		{
			$("#regexId").val(id);
			$('#ckAll').prop('checked', false);
			$('#ckPast').prop('checked', false);
			$('#ckFuture').prop('checked', false);
			$('#ckRange').prop('checked', false);
			$('#model_start_date').val("");
			$('#model_end_date').val("");
			$("#rangeDateDiv").css("display","none");
			$('#ckFormat').prop('checked', false);
			$('#model_date_format').val("");
			$("#formatDateDiv").css("display","none");
			var no = id.charAt(id.length-1);
			//alert($("#date_all"+no).val() + " : " + $("#date_past"+no).val() + " : " + $("#date_future"+no).val());
			if($("#required"+no).val()!="") {
				//alert("if");
				if($("#required"+no).val()=="yes") {
					$("#mandatoryDate1").prop("checked", true);
				} else {
					$("#mandatoryDate2").prop("checked", true);
				}
			}
			else {
				//alert("else");
				$("#mandatoryDate1").prop("checked", true);
			}
			if($("#date_all"+no).val()=="true") {
				$('#ckAll').prop('checked', true);
			} 
			if($("#date_past"+no).val()=="true") {
				$('#ckPast').prop('checked', true);
			}
			if($("#date_future"+no).val()=="true") {
				$('#ckFuture').prop('checked', true);
			}
			if($("#start_date_id"+no).val()!="" && $("#end_date_id"+no).val()!="") {
				$("#rangeDateDiv").css("display","");
				$('#ckRange').prop('checked', true);
				$('#model_start_date').val($("#start_date_id"+no).val());
				$('#model_end_date').val($("#end_date_id"+no).val());
			}
			if($("#date_format"+no).val()!="") {
				$("#formatDateDiv").css("display","");
				$('#ckFormat').prop('checked', true);
				$('#model_date_format').val($("#date_format"+no).val());
			}
			else  {
				/* $('#ckAll').prop('checked', false);
				$('#ckPast').prop('checked', false);
				$('#ckFuture').prop('checked', false); */
			}
			//alert(!($("#start_date_id"+no).val()=="" && $("#end_date_id"+no).val()==""));
			$("#dateValidation").modal();
		}
		else if(val == "FileModule") {
			$("#regexId").val(id);
			$("#modulevalidationDiv").css("display","none");
			$("#fileModulevalidationDiv").css("display","");
			$("#mimeTypeDiv").css("display","");
			$("#mimeTypeAllDiv").css("display","none");
			var no = id.substring(10,id.length);
			//alert("'" + $("#required"+no).val() + "'-" + ($("#regex"+no).val()));
			if($("#regex"+no).val()!="") {
				//$("#modulevalidation").val($("#regex"+no).val());
				$("input[id=\"fileModulevalidation\"][value=\""+$("#regex"+no).val()+ "\"]").prop('checked',true);
			} else {
				$("input[id=\"fileModulevalidation\"][value=\"single\"]").prop('checked',true);
			}
			if($("#fld_val"+no).val()!="") {
				if($("input[id=\"mimeType\"][value=\""+$("#fld_val"+no).val()+"\"]").length == 0) {
					$("#mimeTypeAllDiv").css("display","");
					$("input[id=\"mimeType\"][value=\"All\"]").prop('checked',true);
					$("#mimeTypeAll").val($("#fld_val"+no).val());
				} else {
					$("input[id=\"mimeType\"][value=\""+$("#fld_val"+no).val()+ "\"]").prop('checked',true);
				}
			} else {
				$("input[id=\"mimeType\"][value=\"Image\"]").prop('checked',true);
			}
			if($("#required"+no).val()!="") {
				if($("#required"+no).val()=="yes") {
					$("#mandatory1").prop("checked", true);
				} else {
					$("#mandatory2").prop("checked", true);
				}
			}
			else {
				$("#mandatory1").prop("checked", true);
			}
			
			$("#moduleValidationModal").modal();
		}
	}
</script>
<!-- <script src="js/custom_alert.js"></script> -->
<script type="text/javascript">
function success(){
	alert("success");
	if(checkForm()== true){
		document.getElementById("tableGenerationForm").submit();
	}
}
function cancel(){
	alert("cancel");
}
function info(){
	alert("info");
}

function saveModuleValidationModal()
{
	var regexId = $("#regexId").val();
    var no = regexId.substring(10, regexId.length);
    //alert($('input[name=mandatory]:checked').val() + " : " + $("#modulevalidation").val());
    if($("#fld_ctrl"+no).val()=="file") {
    	//alert($('input[name=fileModulevalidation]:checked').val());
    	$("#regex"+no).val($('input[name=fileModulevalidation]:checked').val());
    	if($("input[name='mimeType']:checked").val()=="All") {
    		$("#fld_val"+no).val($("#mimeTypeAll").val());
    		console.log($("#mimeTypeAll").val());
    	} else {
    		$("#fld_val"+no).val($("input[name='mimeType']:checked").val());
    		console.log($("input[name='mimeType']:checked").val());
    	}
    } else {
    	$("#regex"+no).val($("#modulevalidation").val());
    }
    $("#required"+no).val($('input[name=mandatory]:checked').val());
    $("#modulevalidationDiv").css("display","none");
    //$('input[name=mandatory]:checked').val("true");
    $("#mandatory1").prop("checked", true);
    //alert($("#regex"+no).val() + " : " + $("#required"+no).val());
}

function closeModuleValidationModal()
{
    //alert($('input[name=mandatory]:checked').val() + " : " + $("#modulevalidation").val());
    $("#modulevalidationDiv").css("display","none");
    $("#mandatory1").prop("checked", true);
	//alert($("#regex"+no).val() + " : " + $("#required"+no).val());
}

function saveDateValidationModal()
{
	var regexId = $("#regexId").val();
	//alert(regexId);
	var no = regexId.substring(10, regexId.length);
	//alert($("#model_start_date").val() + " : " + $("#model_end_date").val() + " : " + $("#model_date_format").val());
	$("#required"+no).val($('input[name=mandatoryDate]:checked').val());
	$('#ckAll').is(':checked')? $("#date_all"+no).val("true") : $("#date_all"+no).val("false");
	$('#ckPast').is(':checked')? $("#date_past"+no).val("true") : $("#date_past"+no).val("false");
	$('#ckFuture').is(':checked')? $("#date_future"+no).val("true") : $("#date_future"+no).val("false");
	if($('#ckRange').is(':checked'))
	{
		$("#start_date_id"+no).val($('#model_start_date').val());
		$("#end_date_id"+no).val($('#model_end_date').val());
	}
	else
	{
		$("#start_date_id"+no).val("");
		$("#end_date_id"+no).val("");
	}
	//if($('#ckFormat').is(':checked'))
	{
		$("#date_format"+no).val($('#model_date_format').val());
	}
	$("#mandatoryDate1").prop("checked", true);
	$('#ckAll').prop('checked', false);
	$('#ckPast').prop('checked', false);
	$('#ckFuture').prop('checked', false);
	$('#ckRange').prop('checked', false);
	$('#ckFormat').prop('checked', false);
	//alert($('#ckAll').is(':checked') + " : " + $('#ckPast').is(':checked') + " : " + $('#ckFuture').is(':checked'));
	//alert($("#date_all"+no).val() + " : " + $("#date_past"+no).val() + " : " + $("#date_future"+no).val())
}
function closeDateValidationModal()
{
	$("#mandatoryDate1").prop("checked", true);
	$('#ckAll').prop('checked', false);
	$('#ckPast').prop('checked', false);
	$('#ckFuture').prop('checked', false);
	$('#ckRange').prop('checked', false);
	$('#ckFormat').prop('checked', false);
}

function onStateChanged(id)
{
	if(id=="ckRange" && $('#'+id).is(':checked'))
	{
		$("#rangeDateDiv").css("display","");
	}
	else if(id=="ckRange" && !$('#'+id).is(':checked'))
	{
		$("#rangeDateDiv").css("display","none");
	}
	if(id=="ckFormat" && $('#'+id).is(':checked'))
	{
		$("#formatDateDiv").css("display","");
	}
	else if(id=="ckFormat" && !$('#'+id).is(':checked'))
	{
		$("#formatDateDiv").css("display","none");
	}
	if(id=="mimeType" && $("input[id='"+id+"']:checked").val()=="All")
	{
		$("#mimeTypeAll").val("");
		$("#mimeTypeAllDiv").css("display","");
	}
	else if(id=="mimeType" && $("input[id='"+id+"']:checked").val()!="All")
	{
		$("#mimeTypeAllDiv").css("display","none");
	}
}

function addCustomRegex(){
	var regexPattern = $("#regexPattern").val();
	var name = $("#name").val();
	var validationMsg = $("#validationMsg").val();
	//alert("regex = " + regexPattern + " name" + name);
	var regexId = $("#regexId").val();
	var moduleType = $("#moduleType").val();
	//alert(moduleType);
	var regexData; 
	$.ajax({				
		type : "POST",
		url : "addRegexPattern",
		data : {"regexPattern" : regexPattern,
			"name":name,
			"validationMsg":validationMsg,
			"moduleType":moduleType
			},
		success : function(result) 
		{
			//regexOptionData
			if(moduleType=="TextModule"){
				$("#htmlRegexPatternsForTextModule").val(result);	
			}
			else if(moduleType=="PasswordModule"){
				$("#htmlRegexPatternsForPasswordModule").val(result);
			}
			else if(moduleType=="NumberModule"){
				$("#htmlRegexPatternsForNumberModule").val(result);
			}
			
			//alert("result : "+$("#regexOptionData").val());
			//alert("reg id " + regexId);
			//$("#"+regexId).html(result);
			var no = regexId.substring(10, regexId.length);
			$("#regex"+no).val(regexPattern);
			//$("#"+regexId).val(regexPattern).change();
			var count = $('[id^=tbl_tr]').length;
			//alert(count);
			 /* for(var i=1;i<=count;i++)
			{
				//$("#regex"+i).html(result);
				if($("#fld_ctrl"+i).val()=="textbox" || $("#fld_ctrl"+i).val()=="password" || $("#fld_ctrl"+i).val()=="textarea"  )
				{
					if($("#regex"+i).val() != regexPattern){
						$("#regex"+i).append($('<option>',
							     {
							        value: regexPattern,
							        text : name 
							     }));	
					}
					
				}
				
			} */ 
		}
	});
	$("#regexPattern").val("");
	$("#name").val("");
	$("#validationMsg").val("");
	
}
function closeCustomRegex(){
	
	$("#regexPattern").val("");
	$("#name").val("")
	$("#validationMsg").val("");
}
</script>
</head>
<body>
	<a  class='btn btn-info' href='./audit/audtiRerport'  style=' text-decoration:none;  position:absolute;  top:0; right:0; margin: 10px 20px; color: black;'>Audit Report</a>
	<div class="container">
 	<jsp:include page="alertForm.jsp"></jsp:include>
	
		<h2>Form Schema Table</h2>
		<br />
		<form action="generateTable" method="post" id="tableGenerationForm" target="_blank" >
			<p id="errMsg" style="color: red;">${ errMsg}</p>
			<h4>Page Name / Table Name: <input type="text" data-rule="required|pageName" name="pageName" id="pageName" /></h4>
			<table class="table">
				<thead>
					<tr>
						<th>Field Controller</th>
						<th>Field Datatype</th>
						<th>Field Label</th>
						<th>Field Name</th>
						<th>Field Size</th>
						<th>Index</th>
						<th>Validation</th>
						<th>Tooltip</th>
					</tr>
				</thead>
				<tbody id="table_fields">
					<tr id="tbl_tr1">
						<td>
							<select class="form-control temp" name="fld_ctrl" id="fld_ctrl1" onchange="getFldCtrl('tbl_tr1','fld_ctrl1')" >
								<option value="textbox">TextBox</option>
								<option value="password">Password</option>
								<option value="textarea">TextArea</option>
								<option value="radio">Radio Button</option>
								<option value="checkBox">Check Box</option>
								<option value="comboBox">Select</option>
								<option value="date">Date</option>
								<option value="number">Number</option>
								<option value="alert">Custom Popup</option>
								<option value="hyperlink">Hyperlink</option>
								<option value="file">File</option>
							</select>
						</td>
						<td>
							<select class="form-control" name="fld_type" id="fld_type">
								<option value="INT">INT</option>
								<option value="CHAR">CHAR</option>
								<option value="VARCHAR">VARCHAR</option>
							</select>
						</td>
						<td><input type="text" class=" form-control" data-rule="required|fieldLabel" name="fld_lbl" id="fld_lbl" /></td>
						<td><input type="text" class=" form-control" data-rule="required|fieldName" name="fld_name" id="fld_name"  /></td>
						<td><input type="text" class=" form-control" data-rule="required|fieldSize|between-1-250" name="fld_size" id="fld_size"  /></td>
						<td><input type="text" class=" form-control" data-rule="required|digitOnly|between-1-100" name="fld_index" id="fld_index" size="1" min="1" max="100"  /></td>
						<%-- <td><select class='form-control' name='regex' id='regex1' data-rule="regex" onChange='onRegexChange("regex1")'> ${htmlRegexPatternsForTextModule } </select></td> --%>
						<td>
							<select class='form-control' name="validation" id="validation1" data-rule="regex" onChange='onRegexChange("validation1")' >
								<option value="Please select" selected>Please select</option>
								<option value="TextModule">TextModule</option>
								<option value="Custom">Custom</option>
							</select>
						</td>
						<td><input type="text" class="form-control" data-rule="required" name="tooltip" id="tooltip1" /></td>
						<td><textarea class="form-control" rows="2" cols="22" name="fld_val" id="fld_val" style="display: none;" ></textarea>
						<input type="text" class="form-control" name="date_all" id="date_all1" style="display: none;" />
						<input type="text" class="form-control" name="date_past" id="date_past1" style="display: none;" />
						<input type="text" class="form-control" name="date_future" id="date_future1" style="display: none;" />
						<input type="text" class="form-control" name="start_date" id="start_date_id1" style="display: none;" />
						<input type="text" class="form-control" name="end_date" id="end_date_id1" style="display: none;" />
						<input type="text" class="form-control" name="date_format" id="date_format1" style="display: none;" />
						<input type="text" class="form-control" name="regex" id="regex1" style="display: none;" />
						<input type="text" class="form-control" name="required" id="required1" style="display: none;" /></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<b>Context Help</b></br>
							<textarea name="fromContextHelp" id="fromContextHelp" data-rule="required|length-1-1000" class="form-control" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Write context help at Here!"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<input type="button" class="btn btn-primary" value="Add" id="addFields" />
							<input type="button" class="btn btn-danger" value="Delete" id="delFields" />
						</td>
						<td>
							<br />
							<input type="submit" class="btn btn-success" value="Submit" id="submitForm" />
						</td>
						<td>
							<br />
							<input type="button" class="btn btn-success" id="clear" value="Clear"  />
							 <!-- data-toggle="modal" data-target="#myModal" onclick="alertFuntion('Form Submit','Do you really want to submit the form?','TYPE.yes','Yes','TYPE.no','No')"  -->
						</td>
						<td>
						<br />
							<!-- <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" onclick="alertFuntion('Title','Description','TYPE.success','Success','TYPE.cancle','cancle','TYPE.info','Info','TYPE.info1','Info1','TYPE.info1','Info1')">Open Modal</button> -->
						</td>
					</tr>
				</tfoot>
			</table>
			
		</form>
		<br />
		<br />
		<br />
		<table class="table" id="myTable">
			<thead>
				<tr>
					<th>Sr No.</th>
					<th>Form Name</th>
					<th>View</th>
					<th>Edit</th>
					<th>Drop</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="1"></c:set>
				<c:forEach items="${liPageMappings}" var="pageMappings">
					<tr>
						<td class="col-sm-2"><c:out value="${i}" /></td>
						<td class="col-sm-7"><c:out value="${pageMappings.pageName}" /></td>
						<td class="col-sm-1">
							<form action="openForm/<c:out value="${pageMappings.pageName}" />" method="GET">
								<input type="submit" value="View" />
							</form>
						</td>
						<td class="col-sm-1">
							<form action="updateForm" method="post">
								<input type="hidden" name="pageMappingId" value="${pageMappings.id}" />
								<input type="submit" value="Edit" />
							</form>
						</td>
						<td class="col-sm-1">
							<form action="dropForm" method="post" onsubmit="return dropForm(${pageMappings.id})">
								<input type="hidden" name="pageMappingId" value="${pageMappings.id}" />
								<input type="hidden" name="pageMappingName" value="${pageMappings.pageName}" />
								<input type="submit" value="Drop" />
							</form>
						</td>
					</tr>
					<c:set var="i" value="${i+1}"></c:set>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="modal fade" id="moduleValidationModal" role="dialog">
			<div class="modal-dialog">
				<input type="hidden" id="regexId">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Validation</h4>
					</div>
					<div class="modal-body">
						<label class="radio-inline">
							<input type="radio" name="mandatory" id="mandatory1" value="yes" data-rule="required" checked > Mandatory
						</label>
						<label class="radio-inline">
							<input type="radio" name="mandatory" id="mandatory2" value="no" data-rule="required" > Not Mandatory
						</label>
						<br />
						<br />
						<div id="fileModulevalidationDiv" style="display: none;">
							<label class="radio-inline">
								<input type="radio" name="fileModulevalidation" id="fileModulevalidation" value="single" data-rule="required" checked > Single
							</label>
							<label class="radio-inline">
								<input type="radio" name="fileModulevalidation" id="fileModulevalidation" value="multiple" data-rule="required" > Multiple
							</label>
						</div>
						<div id="mimeTypeDiv" style="display: none;">
							<br />
							<label class="radio-inline">
								<input type="radio" name="mimeType" id="mimeType" value="Image" data-rule="required" onchange="onStateChanged('mimeType')" checked > Image
							</label>
							<label class="radio-inline">
								<input type="radio" name="mimeType" id="mimeType" value="Pdf" data-rule="required" onchange="onStateChanged('mimeType')" > Pdf
							</label>
							<label class="radio-inline">
								<input type="radio" name="mimeType" id="mimeType" value="Office" data-rule="required" onchange="onStateChanged('mimeType')" > Office
							</label>
							<label class="radio-inline">
								<input type="radio" name="mimeType" id="mimeType" value="All" data-rule="required" onchange="onStateChanged('mimeType')" > All
							</label>
							<label class="radio-inline" id="mimeTypeAllDiv" style="display: none;" >
								<input type="text" name="mimeTypeAll" id="mimeTypeAll" data-rule="required" rel="tooltip" data-toggle="tooltip" title="Enter accepted MIME types e.g. png,jpeg,pdf" />
							</label>
						</div>
						<div id="modulevalidationDiv" style="display: none;">
							<select class='form-control' name='modulevalidation' id='modulevalidation' data-rule="regex" >
								
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick='saveModuleValidationModal()'>Save</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick='closeModuleValidationModal()'>Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="dateValidation" role="dialog">
			<div class="modal-dialog">
				<input type="hidden" id="regexId">
				<!-- <input type="hidden" id="tempDateFormatId"> -->
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Select Date Validation</h4>
					</div>
					<div class="modal-body">
						<label class="radio-inline">
							<input type="radio" name="mandatoryDate" id="mandatoryDate1" value="yes" data-rule="required" checked > Mandatory
						</label>
						<label class="radio-inline">
							<input type="radio" name="mandatoryDate" id="mandatoryDate2" value="no" data-rule="required" >Not Mandatory
						</label>
						<br />
						<br />
						<div class="form-group">
							<label class="control-label col-sm-4">
								<input type="checkbox" name="ckAll" id="ckAll" value="ALL" /> ALL
							</label>
							<div class="col-sm-5"></div>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-4">
								<input type="checkbox" name="ckPast" id="ckPast" value="PAST" /> PAST
							</label>
							<div class="col-sm-5"></div>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-4">
								<input type="checkbox" name="ckFuture" id="ckFuture" value="FUTURE" /> FUTURE
							</label>
							<div class="col-sm-5"></div>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-4">
								<input type="checkbox" name="ckRange" id="ckRange" value="RANGE" onchange="onStateChanged('ckRange')" /> RANGE
							</label>
							<div class="col-sm-5" id="rangeDateDiv" style="display: none;">
								<input type="text" class="form-control datetimepicker" name="model_start_date" id="model_start_date" readonly="true" placeholder="Start date" required >
								<input type="text" class="form-control datetimepicker" name="model_end_date" id="model_end_date" readonly="true" placeholder="End date" required >
								<br>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-4">
								<input type="checkbox" name="ckFormat" id="ckFormat" value="FORMAT" onchange="onStateChanged('ckFormat')" /> FORMAT
							</label>
							<div class="col-sm-5" id="formatDateDiv" style="display: none;">
								<select name="model_date_format" id="model_date_format" class="form-control">
									<option value="">Select</option>
									<option value="Y-m-d H:i">yyyy-mm-dd HH:mm</option>
									<option value="H:i Y-m-d">HH:mm yyyy-mm-dd</option>
									<option value="d.m.Y H:i">dd.mm.yyyy HH:mm</option>
									<option value="H:i d.m.Y">HH:mm dd.mm.yyyy</option>
									<option value="Y/m/d H:i">yyyy/mm/dd HH:mm</option>
									<option value="H:i Y/m/d">HH:mm yyyy/mm/dd</option>
								</select>
							</div>
						</div>
						<br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick='saveDateValidationModal()'>Save</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick='closeDateValidationModal()'>Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="cutomPatternModal" role="dialog">
			<div class="modal-dialog">
				<input type="hidden" id="regexId" value="">
				<input type="hidden" id="htmlRegexPatternsForTextModule">
				<input type="hidden" id="htmlRegexPatternsForNumberModule">
				<input type="hidden" id="htmlRegexPatternsForPasswordModule">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Range</h4>
					</div>
					<div class="modal-body">
						Regex Validation  Pattern:
						<input type="text" class="form-control "
							name="regexPattern" id="regexPattern" required />
						<br />
						Regex Validation Name :
						<input type="text" class="form-control"
							name="name" id="name" required />
						Regex Validation Message :
						<input type="text" class="form-control"
							name="validationMsg" id="validationMsg" required />
						Module Type: 
						<select  class="form-control" id="moduleType" name="moduleType" >
						 <option value="TextModule">Text Module</option>
						 <option value="PasswordModule">Password Module</option>
						 <option value="NumberModule">Number Module</option>
						</select>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick='addCustomRegex()'>Save</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick='closeCustomRegex()'>Close</button>
					</div>
				</div>
	
			</div>
		</div>
		
		
	</div>
	
</body>
<script src="js/formutility_date.js"></script>
<script>
	/* validation.init("form"); */
	var validateJs = new Validator(document.querySelector('#tableGenerationForm'), function (err, res) {
    	return res;
	});
</script>
</html>