<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>Employee</title>
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
	<a href='../index' class='glyphicon glyphicon-home btn-lg'
		style='margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>Employee</h2>
		</center>
		<form action="../insertForm/Employee" id="idEmployee"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">Emp Code</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="emp_code"
						id="emp_code" tabindex="1" maxlength="5"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Emp Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="emp_name"
						id="emp_name" tabindex="2" maxlength="15"
						data-rule="required|Only_aplha" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitEmployee"
						value="Submit" />
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
						<th>Emp Code</th>
						<th>Emp Name</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.emp_code}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_name}" /></td>
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
		$('#submitEmployee').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idEmployee'),
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
					}
				}
			});
</script>
<script></script>
</html>
