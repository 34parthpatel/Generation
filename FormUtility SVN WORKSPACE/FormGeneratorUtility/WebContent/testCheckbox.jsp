<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>testCheckbox</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript">
function check()
{
	var count = 0;
	/* $.each($("input[type='checkbox']:checked"), function() {
		count++;
	}); */
	$('input[name="temp"]').each(function() {
		if(document.getElementById('temp').checked)
		{
			count++;
		}
	});
	alert(count);
	return false;
}
</script>
</head>
<body>
	<div class="container">
		<center>
			<h2>testCheckbox</h2>
		</center>
		<form action="../insertForm/testCheckbox" class="form-horizontal"
			method="post" onsubmit="return check()">
			<div class="form-group ">
				<label class="control-label col-sm-4">Temp</label>
				<div class="col-sm-5">
					<input type="checkbox" name="temp" id="temp" tabindex="1"
						pattern=":pattern" value=Name1 /> Name1<br />
					<input type="checkbox" name="temp" id="temp" tabindex="1"
						pattern=":pattern" value=Name2 /> Name2<br />
					<input type="checkbox" name="temp" id="temp" tabindex="1"
						pattern=":pattern" value=Name3 /> Name3<br />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Temp1</label>
				<div class="col-sm-5">
					<input type="checkbox" name="temp1" id="temp1" tabindex="2"
						pattern=":pattern" value=One /> One<br />
					<input type="checkbox" name="temp1" id="temp1" tabindex="2"
						pattern=":pattern" value=Two /> Two<br />
					<input type="checkbox" name="temp1" id="temp1" tabindex="2"
						pattern=":pattern" value=Three /> Three<br />
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
						<th>Temp</th>
						<th>Temp1</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.temp}" /></td>
							<td class="col-m-2"><c:out value="${obj.temp1}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
<script src="../js/formutility.js"></script>
</html>
