<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>user</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
<script src="../js/formutility.js"></script>
<script src="../js/bootstrap-show-password.min.js"></script>
</head>
<body>
	<div class="container">
		<center>
			<h2>user</h2>
		</center>
		<form action="../insertForm/user" class="form-horizontal"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">username</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="user" id="user"
						tabindex="1" pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$"
						title="Only alphanumeric allow." required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="pass" id="pass"
						tabindex="2"
						pattern="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\S+$).{8,}"
						title="Password must be, 2 Latter Capital,2 special char ,and any later and any digit"
						data-toggle="password" required />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" />
				</div>
			</div>
		</form>
		<c:if test="${not empty message}">
			<font color='green'><c:out value="${message }"></c:out></font>
		</c:if>
		<c:if test="${not empty errMessage}">
			<font color='red'><c:out value="${errMessage }"></c:out></font>
		</c:if>
	</div>
	<div class="container" style="overflow-x: auto;">
		<c:if test="${not empty listData}">
			<table class="table">
				<thead style='color: #ccffe6; background-color: #87ceeb'>
					<tr>
						<th>username</th>
						<th>Password</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.user}" /></td>
							<td class="col-m-2"><c:out value="${obj.pass}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
</html>
