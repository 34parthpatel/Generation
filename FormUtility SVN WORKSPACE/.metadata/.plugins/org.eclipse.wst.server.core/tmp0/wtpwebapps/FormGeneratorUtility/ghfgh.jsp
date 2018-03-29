<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="datatableLib.jsp" %>
<!DOCTYPE html >
<html>
<head>
<title>ghfgh</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery.datetimepicker.min.css">
<link rel="stylesheet" href="../css/forms.css">
<!-- <script src="../js/jquery-3.2.1.min.js"></script> -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.datetimepicker.full.js"></script>
<script src="../js/formutility.js"></script>
<script src="../js/custom_alert.js"></script>
<script src="../js/bootstrap-show-password.min.js"></script>
<script src="../js/js-form-validator.min.js"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
		$('body').tooltip({
			selector : '[rel=tooltip]'
		});
	});
</script>
</head>
<body>
	<a href='../index' class='glyphicon glyphicon-home btn-lg'
		style='text-decoration: none; margin: 10px 20px; color: black;'></a>
	<a class='glyphicon glyphicon-question-sign btn-lg' href='#'
		title='Help' data-toggle='popover' data-placement='left'
		data-trigger='focus' data-content='fghfghfghfghfgh'
		style='text-decoration: none; position: absolute; top: 0; right: 0; margin: 10px 20px; color: black;'></a>
	<div class="container">
		<center>
			<h2>ghfgh</h2>
		</center>
		<form action="../insertForm/ghfgh" id="idghfgh"
			class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4">fgh</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="fghfgh" id="fghfgh"
						tabindex="1" maxlength="6" title="fghfgh" rel="tooltip"
						data-toggle="tooltip" data-placement="right"
						data-rule="required|Digit_Only" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<input type="submit" class="btn btn-success" id="submitghfgh"
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
		<button>Add</button>
		<%-- <c:if test="${not empty listData}">
			<table class="table">
				<thead style='color: #ccffe6; background-color: #87ceeb'>
					<tr>
						<th>fgh</th>
					</tr>
				</thead>
				<c:forEach items="${listData}" var="obj">
					<tbody>
						<tr>
							<td class="col-m-2"><c:out value="${obj.fghfgh}" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if> --%>
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example1">
			<thead>
				<tr>
					<th width="10%">ID</th>
					<th width="10%">fgh</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script src="../js/formutility_date.js"></script>
<script>
	$(function() {
		$('#submitghfgh').click(function() {
			document.getElementById("errMessage").innerHTML = "";
			return true;
		});
	});
</script>
<script>
	new Validator(
			document.querySelector('#idghfgh'),
			function(err, res) {
				return res;
			},
			options = {
				rules : {
					Digit_Only : function(a) {
						return (new RegExp('^[1-9]{1,}[0-9]{0,}$')).test(a)
					},
				},
				messages : {
					en : {
						Digit_Only : {
							empty : "Only digit allow, first character must be not Zero.",
							incorrect : "Only digit allow, first character must be not Zero."
						},
					}
				}
			});
</script>
<script></script>
<script type="text/javascript">
var oTable = $('#example1').dataTable({
	"columns" : [ {"data" : "id"},
	              {"data" : "fghfgh"},],
	"processing" : true,
	"serverSide" : true,
	//"paging": true,
	"ajax" : {
		 "contentType": "application/json",
        "data": function ( d ) {
                  return JSON.stringify( d );
           },
		"url" : "../listForDatatable/ghfgh",
		"dataSrc" : "data",
		"type" : "POST"
	}
});
</script>
</html>
