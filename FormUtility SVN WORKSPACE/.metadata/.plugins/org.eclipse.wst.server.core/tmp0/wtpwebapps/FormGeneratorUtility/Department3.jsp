<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>Department3</title>
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
</head>
<body>
	<div class="container">
		<center>
			<h2>Department3</h2>
		</center>
		<form action="../insertForm/Department3" id="idDepartment3"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">Dept Id</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="dept_id" id="dept_id"
						tabindex="1" maxlength="5" data-rule="required|Aplha_numeric" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Dept Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="dept_name"
						id="dept_name" tabindex="2" maxlength="15"
						data-rule="required|Required" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="password"
						id="password" tabindex="3" maxlength="12"
						data-rule="required|Password" /><input type="checkbox"
						onclick="showPassword('password')">Show Password
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Address</label>
				<div class="col-sm-5">
					<textarea name="address" id="address" class="form-control"
						placeholder="Enter text..." rows="5" cols="30" tabindex="4"
						maxlength="150" data-rule="required|Address_Validation"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="5"
								value=Male data-rule="required" />Male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="5"
								value=Female data-rule="required" />Female<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="5"
								value=Other data-rule="required" />Other<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Date1</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="date1" id="date1"
						tabindex="6" onkeypress="return false;" readonly
						data-rule="required" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Project name</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="projectname" id="projectname1"
								tabindex="7" value=projectOne /> projectOne<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="projectname" id="projectname2"
								tabindex="7" value=projectTwo /> projectTwo<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="projectname" id="projectname3"
								tabindex="7" value=projectThree /> projectThree<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="projectname" id="projectname4"
								tabindex="7" value=projectFour /> projectFour<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Date Time</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="datetime1"
						id="datetime1" tabindex="8" onkeypress="return false;" readonly
						data-rule="required" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Number</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="number1"
						id="number1" tabindex="9" step="1" data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Hyperlink</label>
				<div class="col-sm-5">
					<a href='https://www.google.co.in/' tabindex=11>Hyperlink</a>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitDepartment3"
						value="Submit" />&nbsp
					<button class='btn btn-default' data-toggle='modal'
						data-target='#myModal' tabindex=10
						onclick="alertFuntion('Alert','alert box...','TYPE.save','Save','TYPE.cancel','Cancel') ">Alert</button>
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
						<th>Dept Id</th>
						<th>Dept Name</th>
						<th>Password</th>
						<th>Address</th>
						<th>Gender</th>
						<th>Date1</th>
						<th>Project name</th>
						<th>Date Time</th>
						<th>Number</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.dept_id}" /></td>
							<td class="col-m-2"><c:out value="${obj.dept_name}" /></td>
							<td class="col-m-2"><c:out value="${obj.password}" /></td>
							<td class="col-m-2"><c:out value="${obj.address}" /></td>
							<td class="col-m-2"><c:out value="${obj.gender}" /></td>
							<td class="col-m-2"><c:out value="${obj.date1}" /></td>
							<td class="col-m-2"><c:out value="${obj.projectname}" /></td>
							<td class="col-m-2"><c:out value="${obj.datetime1}" /></td>
							<td class="col-m-2"><c:out value="${obj.number1}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if><jsp:include page='alertForm.jsp'></jsp:include></div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitDepartment3')
				.click(
						function() {
							if (!$('input[name=projectname]:checked').length > 0) {
								document.getElementById("errMessage").innerHTML = "Project name can not be null";
								return false;
							}
							document.getElementById("errMessage").innerHTML = "";
							return true;
						});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idDepartment3'),
			function(err, res) {
				return res;
			},
			options = {
				rules : {
					Aplha_numeric : function(a) {
						return (new RegExp('^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$'))
								.test(a)
					},
					Required : function(a) {
						return (new RegExp('(.*)')).test(a)
					},
					Password : function(a) {
						return (new RegExp(
								'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\\S+$).{8,}'))
								.test(a)
					},
					Address_Validation : function(a) {
						return (new RegExp('^[A-Za-z0-9,/-]{1,}$')).test(a)
					},
					Digit_Only : function(a) {
						return (new RegExp('^[1-9]{1,}[0-9]{0,}$')).test(a)
					},
				},
				messages : {
					en : {
						Aplha_numeric : {
							empty : "Only alphanumeric allow.",
							incorrect : "Only alphanumeric allow."
						},
						Required : {
							empty : " ",
							incorrect : " "
						},
						Password : {
							empty : "Password must be, 2 Latter Capital,2 special char ,and any later and any digit",
							incorrect : "Password must be, 2 Latter Capital,2 special char ,and any later and any digit"
						},
						Address_Validation : {
							empty : "Please enter proper address...",
							incorrect : "Please enter proper address"
						},
						Digit_Only : {
							empty : "Only digit allow, first character must be not Zero.",
							incorrect : "Only digit allow, first character must be not Zero."
						},
					}
				}
			});
</script>
<script>
	$('#date1').datetimepicker({
		timepicker : false,
		defaultDate : '13.12.2017',
		minDate : '13.12.2017',
		maxDate : '15.12.2017',
		format : 'd.m.Y',
		formatDate : 'd.m.Y',
	});
	$('#datetime1').datetimepicker({
		defaultDate : '16:56 2018/01/11',
		minDate : '16:56 2018/01/11',
		maxDate : '16:56 2018/01/12',
		format : 'H:i Y/m/d',
		formatDate : 'H:i Y/m/d',
		step : 1,
	});
</script>
</html>
