<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>temp_one</title>
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
			<h2>temp_one</h2>
		</center>
		<form action="../insertForm/temp_one" id="idtemp_one"
			class="form-horizontal" method="post"
			onsubmit="return checkFormData()">
			<div class="form-group">
				<label class="control-label col-sm-4">Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="name"
						tabindex="1" maxlength="15" data-rule="required|aplhaNumeric" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" />
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
						<th>Name</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.name}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	function checkFormData() {
		return true;
	}
	new Validator(document.querySelector('#idtemp_one'), function(err, res) {
		return res;
	});
</script>
<script></script>
</html>
