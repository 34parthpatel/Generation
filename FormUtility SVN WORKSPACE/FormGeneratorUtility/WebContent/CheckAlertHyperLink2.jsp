<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html ><html><head><title>CheckAlertHyperLink2</title><link rel="stylesheet" href="../css/bootstrap.min.css"><link rel="stylesheet" href="../css/jquery.datetimepicker.min.css"><script src="../js/jquery-3.2.1.min.js"></script><script src="../js/bootstrap.min.js"></script><script src="../js/jquery.datetimepicker.full.js"></script><script src="../js/formutility.js"></script><script src="../js/custom_alert.js"></script><script src="../js/bootstrap-show-password.min.js"></script></head><body><div class="container"><center><h2>CheckAlertHyperLink2</h2></center><form action="../insertForm/CheckAlertHyperLink2" class="form-horizontal" method="post"><div class="form-group"><label class="control-label col-sm-4">Silvertouch Compnay</label><div class="col-sm-5"><button class='btn' data-toggle='modal' data-target='#myModal' onclick="alertFuntion('Silvertouch Compnay','Are_you_Interested_to_Join_Silvertouch?_','TYPEyes','yes','TYPEno','no')"/>Alert</button></div></div><div class="form-group"><label class="control-label col-sm-4">Department ID</label><div class="col-sm-5"><input type="text"  class="form-control" name="deptid" id="deptid" tabindex="3" pattern="^[1-9]{1,}[0-9]{0,}$" title="Only digit allow, first character must be not Zero." required maxlength="10" /></div></div><div class="form-group"><div class="col-sm-offset-4 col-sm-5"><input type="submit" class="btn btn-success" /></div></div></form><c:if test="${not empty message}"><font color='green'><c:out value="${message }"></c:out></font></c:if><c:if test="${not empty errMessage}"><font color='red'> ${errMessage } </font></c:if></div><div class="container" style="overflow-x:auto;"><c:if test="${not empty listData}" >	<table class="table"> 	<thead style='color:#ccffe6;background-color:#87ceeb'>		<tr><th>Department ID</th>	</tr></thead>	<c:forEach items="${listData}" var="obj">	<tbody><tr><td class="col-m-2"><c:out value="${obj.deptid}" /></td>	</tr></tbody>	</c:forEach></table></c:if><jsp:include page='alertForm.jsp'></jsp:include></div></body><script src="../js/formutility_date.js"></script><script></script></html>