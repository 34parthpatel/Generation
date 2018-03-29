<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>temp</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
</head>
<body>
	<div class="container">
		<center>
				<label><h2>temp</h2></label>
				<label><p>?</p></label>
		</center>
		<form action="../insertForm/temp" class="form-horizontal"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">name1</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name1" id="name1"
						tabindex="1" pattern="^[1-9]{1,}[0-9]{0,}$"
						title="Only digit allow, first character must be not Zero."
						required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Department ID</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="deptid" id="deptid"
						tabindex="1" pattern="^[1-9]{1,}[0-9]{0,}$"
						title="Only digit allow, first character must be not Zero."
						required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">name2</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name2" id="name2"
						tabindex="2" pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$"
						title="Only alphanumeric allow." required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Department Project</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="deptproject"
						id="deptproject" tabindex="2"
						pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$"
						title="Only alphanumeric allow." required />
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
						<th>name1</th>
						<th>Department ID</th>
						<th>name2</th>
						<th>Department Project</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.name1}" /></td>
							<td class="col-m-2"><c:out value="${obj.deptid}" /></td>
							<td class="col-m-2"><c:out value="${obj.name2}" /></td>
							<td class="col-m-2"><c:out value="${obj.deptproject}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
</html>
