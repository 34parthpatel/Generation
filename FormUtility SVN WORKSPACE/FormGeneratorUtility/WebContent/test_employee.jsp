<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>test_employee</title>
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
		data-trigger='focus' data-content='Context help for Test Employee'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>test_employee</h2>
		</center>
		<form action="../insertForm/test_employee" id="idtest_employee"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="code" id="code"
						tabindex="1" maxlength="5" data-rule="|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="name"
						tabindex="2" maxlength="15" data-rule="|Only_aplha" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="password"
						id="password" tabindex="3" maxlength="10" data-rule="|Password" /><input
						type="checkbox" onclick="showPassword('password')">Show
					Password
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="4"
								value=Male />Male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="4"
								value=Female />Female<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Project</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="project" id="project1" tabindex="5"
								value=HSIIDC /> HSIIDC<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="project" id="project2" tabindex="5"
								value=FGU /> FGU<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Department</label>
				<div class="col-sm-5">
					<select class="form-control" name="dept" id="dept" tabindex="6"><option
							value='JAVA'>JAVA</option>
						<option value='DOT NET'>DOT NET</option>
						<option value='PHP'>PHP</option></select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Date</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="dt" id="dt"
						tabindex="7" onkeypress="return false;" readonly data-rule="" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Number</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="num" id="num"
						tabindex="8" step="0.01" data-rule="required|Float_Validation" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success"
						id="submittest_employee" value="Submit" />
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
						<th>code</th>
						<th>Name</th>
						<th>Password</th>
						<th>Gender</th>
						<th>Project</th>
						<th>Department</th>
						<th>Date</th>
						<th>Number</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.code}" /></td>
							<td class="col-m-2"><c:out value="${obj.name}" /></td>
							<td class="col-m-2"><c:out value="${obj.password}" /></td>
							<td class="col-m-2"><c:out value="${obj.gender}" /></td>
							<td class="col-m-2"><c:out value="${obj.project}" /></td>
							<td class="col-m-2"><c:out value="${obj.dept}" /></td>
							<td class="col-m-2"><c:out value="${obj.dt}" /></td>
							<td class="col-m-2"><c:out value="${obj.num}" /></td>
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
		$('#submittest_employee').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idtest_employee'),
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
					Password : function(a) {
						return (new RegExp(
								'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\\S+$).{8,}'))
								.test(a)
					},
					Float_Validation : function(a) {
						return (new RegExp('^[0-9.]{1,}$')).test(a)
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
						Password : {
							empty : "Password must be, 2 Latter Capital,2 special char ,and any later and any digit",
							incorrect : "Password must be, 2 Latter Capital,2 special char ,and any later and any digit"
						},
						Float_Validation : {
							empty : "Enter Valid Number",
							incorrect : "Enter Valid Number"
						},
					}
				}
			});
</script>
<script>
	$('#dt').datetimepicker({
		timepicker : false,
		defaultDate : '10.01.2018',
		minDate : '10.01.2018',
		maxDate : '22.01.2018',
		format : 'd.m.Y',
		formatDate : 'd.m.Y',
	});
</script>
</html>
