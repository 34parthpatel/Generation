<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>EmployeeMaster</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
</head>
<body>
	<div class="container">
		<center>
			<h2>EmployeeMaster</h2>
		</center>
		<form action="../insertForm/EmployeeMaster" class="form-horizontal"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">Employee Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="Emp_nm" id="Emp_nm"
						tabindex="1" pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$"
						title="Only alphanumeric allow." required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Residential Address</label>
				<div class="col-sm-5">
					<textarea name="Emp_add" id="Emp_add" class="form-control"
						placeholder="Enter text..." rows="5" cols="30" tabindex="2"
						required pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Birthdate</label>
				<div class="col-sm-5">
					<input type="date" id="Emp_Dob_dt" name="Emp_Dob_dt" tabindex="3"
						required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Hobby</label>
				<div class="col-sm-5">
					<input type="radio" name="Emp_Hobby" id="Emp_Hobby" tabindex="4"
						required pattern=":pattern" value=Reading /> Reading<br />
					<input type="radio" name="Emp_Hobby" id="Emp_Hobby" tabindex="4"
						required pattern=":pattern" value=Cricket /> Cricket<br />
					<input type="radio" name="Emp_Hobby" id="Emp_Hobby" tabindex="4"
						required pattern=":pattern" value=Adventure /> Adventure<br />
					<input type="radio" name="Emp_Hobby" id="Emp_Hobby" tabindex="4"
						required pattern=":pattern" value=Travel /> Travel<br />
					<input type="radio" name="Emp_Hobby" id="Emp_Hobby" tabindex="4"
						required pattern=":pattern" value=Music /> Music<br />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="Password"
						id="Password" tabindex="5"
						pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$"
						title="Only alphanumeric allow." required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<input type="checkbox" name="Emp_gender" id="Emp_gender"
						tabindex="6" pattern=":pattern" value=Male /> Male<br />
					<input type="checkbox" name="Emp_gender" id="Emp_gender"
						tabindex="6" pattern=":pattern" value=Female /> Female<br />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">District</label>
				<div class="col-sm-5">
					<select class="form-control" name=":name" id=":id"
						tabindex=":tabindex" required pattern=":pattern" />
					<option value='Ahmedabad'>Ahmedabad</option>
					<option value='Baroda'>Baroda</option>
					<option value='Gandhinagar'>Gandhinagar</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Age</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="Emp_age"
						id="Emp_age" tabindex="8" step="1" required />
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
						<th>Employee Name</th>
						<th>Residential Address</th>
						<th>Birthdate</th>
						<th>Hobby</th>
						<th>Password</th>
						<th>Gender</th>
						<th>District</th>
						<th>Age</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.emp_nm}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_add}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_dob_dt}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_hobby}" /></td>
							<td class="col-m-2"><c:out value="${obj.password}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_gender}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_dist}" /></td>
							<td class="col-m-2"><c:out value="${obj.emp_age}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
</html>
