<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>oraganization</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<link rel="stylesheet" href="../css/forms.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
<script src="../js/formutility.js"></script>
<script src="../js/custom_alert.js"></script>
<script src="../js/bootstrap-show-password.min.js"></script>
<script src="../js/js-form-validator.min.js"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>
</head>
<body>
	<a href='../index' class='glyphicon glyphicon-home btn-lg'
		style='text-decoration: none; margin: 10px 20px; color: black;'></a>
	<a class='glyphicon glyphicon-question-sign btn-lg' href='#'
		title='Help' data-toggle='popover' data-placement='left'
		data-trigger='focus' data-content='Help organization.'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>oraganization</h2>
		</center>
		<form action="../insertForm/oraganization" id="idoraganization"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">orgid</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="org_id" id="org_id"
						tabindex="1" maxlength="5" data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="name"
						tabindex="2" maxlength="12" data-rule="|Only_aplha" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Address</label>
				<div class="col-sm-5">
					<textarea name="address" id="address" class="form-control"
						placeholder="Enter text..." rows="5" cols="30" tabindex="3"
						maxlength="250" data-rule="required|Org_validation"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Radio</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="radio" id="radio" tabindex="4"
								value=Yes />Yes<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="radio" id="radio" tabindex="4" value=No />No<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Radio2</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="radio2" id="radio2" tabindex="5"
								value=save data-rule="required" />save<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="radio2" id="radio2" tabindex="5"
								value=cancel data-rule="required" />cancel<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">checkBox</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="checkbox" id="checkbox1"
								tabindex="6" value=cone /> cone<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="checkbox" id="checkbox2"
								tabindex="6" value=ctwo /> ctwo<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">checkbox2</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="checkbox2" id="checkbox21"
								tabindex="7" value=cthree /> cthree<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="checkbox2" id="checkbox22"
								tabindex="7" value=cfour /> cfour<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Combobox</label>
				<div class="col-sm-5">
					<select class="form-control" name="combobox" id="combobox"
						tabindex="8" data-rule="combobox"><option
							value='Please select' selected>Please select</option>
						<option value='cbone'>cbone</option>
						<option value='cbtwo'>cbtwo</option></select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Date</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="dt" id="dt"
						tabindex="9" onkeypress="return false;" readonly data-rule="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Description</label>
				<div class="col-sm-5">
					<textarea name="description" id="description" class="form-control"
						placeholder="Enter text..." rows="5" cols="30" tabindex="10"
						maxlength="150" data-rule="required|Org_validation"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success"
						id="submitoraganization" value="Submit" />
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
		<c:if test="${not empty listData}">
			<table class="table">
				<thead style='color: #ccffe6; background-color: #87ceeb'>
					<tr>
						<th>orgid</th>
						<th>Name</th>
						<th>Address</th>
						<th>Radio</th>
						<th>Radio2</th>
						<th>checkBox</th>
						<th>checkbox2</th>
						<th>Combobox</th>
						<th>Date</th>
						<th>Description</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.org_id}" /></td>
							<td class="col-m-2"><c:out value="${obj.name}" /></td>
							<td class="col-m-2"><c:out value="${obj.address}" /></td>
							<td class="col-m-2"><c:out value="${obj.radio}" /></td>
							<td class="col-m-2"><c:out value="${obj.radio2}" /></td>
							<td class="col-m-2"><c:out value="${obj.checkbox}" /></td>
							<td class="col-m-2"><c:out value="${obj.checkbox2}" /></td>
							<td class="col-m-2"><c:out value="${obj.combobox}" /></td>
							<td class="col-m-2"><c:out value="${obj.dt}" /></td>
							<td class="col-m-2"><c:out value="${obj.description}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitoraganization')
				.click(
						function() {
							if (!$('input[name=checkbox]:checked').length > 0) {
								document.getElementById("errMessage").innerHTML = "checkBox can not be null";
								return false;
							}
							if (!$('input[name=checkbox2]:checked').length > 0) {
								document.getElementById("errMessage").innerHTML = "checkbox2 can not be null";
								return false;
							}
							document.getElementById("errMessage").innerHTML = "";
							return true;
						});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idoraganization'),
			function(err, res) {
				return res;
			},
			options = {
				rules : {
					Digit_Only : function(a) {
						return (new RegExp('^[1-9]{1,}[0-9]{0,}$')).test(a)
					},
					Only_aplha : function(a) {
						return (new RegExp('^[A-Za-z]{0,}$')).test(a)
					},
					Org_validation : function(a) {
						return (new RegExp('^[a-z]$')).test(a)
					},
					combobox : function(a) {
						return (a.trim().toLowerCase() !== 'please select')
					},
					Org_validation : function(a) {
						return (new RegExp('^[a-z]$')).test(a)
					},
				},
				messages : {
					en : {
						Digit_Only : {
							empty : "Only digit allow, first character must be not Zero.",
							incorrect : "Only digit allow, first character must be not Zero."
						},
						Only_aplha : {
							empty : "Only alphabets allow.",
							incorrect : "Only alphabets allow."
						},
						Org_validation : {
							empty : "Please provide proper validation",
							incorrect : "Please provide proper validation"
						},
						combobox : {
							empty : "Please select Combobox",
							incorrect : "Please select Combobox"
						},
						Org_validation : {
							empty : "Please provide proper validation",
							incorrect : "Please provide proper validation"
						},
					}
				}
			});
</script>
<script>
	$('#dt').datetimepicker({
		timepicker : false,
		minDate : '-1970/01/01',
		format : 'Y-m-d',
		formatDate : 'Y-m-d',
	});
</script>
</html>
