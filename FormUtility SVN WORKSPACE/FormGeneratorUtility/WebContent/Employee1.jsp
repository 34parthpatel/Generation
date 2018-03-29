<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>Employee1</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
</head>
<body>
	<div class="container">
		<center>
			<h2>Employee1</h2>
		</center>
		<form action="../insertForm/Employee1" class="form-horizontal"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">First Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="firstname"
						id="firstname" tabindex="1" pattern="^[A-Za-z]{0,}"
						title="Only alphabets allow." required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Last name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="lastname"
						id="lastname" tabindex="2" pattern="^[A-Za-z]{0,}"
						title="Only alphabets allow." required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<input type="radio" name="gender" id="gender" tabindex="3" required
						pattern=":pattern" value=Male /> Male<br />
					<input type="radio" name="gender" id="gender" tabindex="3" required
						pattern=":pattern" value=Female /> Female<br />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Project name</label>
				<div class="col-sm-5">
					<input type="checkbox" name="projectname" id="projectname"
						tabindex="4" pattern=":pattern" value=HSIIDC /> HSIIDC<br />
					<input type="checkbox" name="projectname" id="projectname"
						tabindex="4" pattern=":pattern" value=CRM /> CRM<br />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Number</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="number" id="number"
						tabindex="5" pattern="^[1-9]{1,}[0-9]{0,}$"
						title="Only digit allow, first character must be not Zero."
						required />
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
						<th>First Name</th>
						<th>Last name</th>
						<th>Gender</th>
						<th>Project name</th>
						<th>Number</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.firstname}" /></td>
							<td class="col-m-2"><c:out value="${obj.lastname}" /></td>
							<td class="col-m-2"><c:out value="${obj.gender}" /></td>
							<td class="col-m-2"><c:out value="${obj.projectname}" /></td>
							<td class="col-m-2"><c:out value="${obj.number}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
</html>
