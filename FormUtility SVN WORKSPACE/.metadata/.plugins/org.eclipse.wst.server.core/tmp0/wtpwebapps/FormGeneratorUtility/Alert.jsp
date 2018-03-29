<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html >
<html>
<head>
<title>Alert</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<!-- <link rel="stylesheet" href="../css/validation.min.css"> -->
<link rel="stylesheet" href="../css/forms.css">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
<script src="../js/formutility.js"></script>
<script src="../js/custom_alert.js"></script>
<script src="../js/bootstrap-show-password.min.js"></script>
<!-- <script src="../js/validation.min.js"></script> -->
<script src="../js/js-form-validator.min.js"></script>
<script type="text/javascript">
	function valid(val) {
		if (val.checkValidity() == false) {
			event.target.checkValidity();
			var email = document.querySelector('input[name="email"]');
			email.addEventListener('invalid', function() {
				if (this.value.trim() !== '') {
					this.setCustomValidity("'" + this.value
							+ "' is not a valid email bro!");
				}
			}, false);
		}

	}
</script>
<script>
/* $(document).ready(function(){
    $("input").blur(function(){
    	validateJs.showErrors();
    });
});
 */
</script>
</head>
<body>
	<a href="../index" class="glyphicon glyphicon-home btn-lg" style="padding: 2px 2px; margin: 10px 20px; color: black;"></a>
	<div class="container">
		<center>
			<h2>Alert</h2>
		</center>
		<form action="../insertForm/Alert" id="myForm" class="form-horizontal"
			id="myForm" method="post" onsubmit="return checkFormData()">
			<div class="form-group">
				<label class="control-label col-sm-4">Name</label>
				<div class="col-sm-5">
					<input type="text" class=" form-control"
						data-rule="required|between-5-15" name="name" id="name"
						tabindex="1" maxlength="15" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Name</label>
				<div class="col-sm-5">
					<input type="text" class=" form-control" data-rule="required|custom1"
						name="name" id="name1" tabindex="1" maxlength="15" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">date1</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="date1" id="date1"
						tabindex="1" data-rule="required|" onkeypress="return false;" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">date1</label>
				<div class="col-sm-5">
					<textarea type="text" class="form-control" name="asd" id="asd"
						tabindex="1" data-rule="required|custom"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Gender</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="5"
								pattern=":pattern" data-rule="required" value=Male /> Male<br />
						</div>
						<div class='col-sm-6'>
							<input type="radio" name="gender" id="gender" tabindex="5"
								pattern=":pattern" data-rule="required" value=Female /> Female<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Hobby</label>
				<div class="col-sm-5">
					<div class='row'>
						<div class='col-sm-6'>
							<input type="checkbox" name="hobby" id="hobby" tabindex="6"
								pattern=":pattern" value=Cricket /> Cricket<br />
						</div>
						<div class='col-sm-6'>
							<input type="checkbox" name="hobby" id="hobby" tabindex="6"
								pattern=":pattern" value=Hockey /> Hockey<br />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Alert Me</label>
				<div class="col-sm-5">
					<a class='btn btn-default' data-toggle='modal'
						data-target='#myModal' tabindex=2
						onclick="alertFuntion('Alert Me','alert...','TYPE.ok','OK') ">Alert</a>
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
		</c:if><jsp:include page='alertForm.jsp'></jsp:include></div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	function checkFormData() {
		validateJs.validate(this);
		return true;
	}

	/* validation.init("form"); */

	var validateJs = new Validator(document.querySelector('#myForm'), function(err, res) {
		return res;
	}, options = {
		rules : {
			custom : function(a) {
				return (new RegExp('^[A-Za-z]{0,}$')).test(a)
			},
			custom1: function(a) {
				return (new RegExp('^[A-Za-z]{0,}$')).test(a)
			},
		},
		messages : {
			en : {
				custom : {
					incorrect : 'Error ;-)'
				},
				custom1 : {
					empty: "Only small alphabet letters allow",
                	incorrect: "Only small alphabet lette allow"
				},
			}
		}
	});
</script>
<script>
	$('#date1').datetimepicker({
		timepicker : false,
		defaultDate : '2018-01-11',
		minDate : '2018-01-11',
		maxDate : '2018-01-13',
		format : 'Y-m-d',
		formatDate : 'Y-m-d',
	});
</script>
</html>
