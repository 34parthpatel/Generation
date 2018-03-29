<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html ><html><head><title>MobileTest</title><link rel="stylesheet" href="../css/bootstrap.min.css"><link rel="stylesheet" href="../css/jquery.datetimepicker.min.css"><script src="../js/jquery-3.2.1.min.js"></script><script src="../js/bootstrap.min.js"></script><script src="../js/jquery.datetimepicker.full.js"></script><script src="../js/formutility.js"></script><script src="../js/custom_alert.js"></script><script src="../js/bootstrap-show-password.min.js"></script></head><body><div class="container"><center><h2>MobileTest</h2></center><form action="../insertForm/MobileTest" class="form-horizontal" method="post" onsubmit="return checkFormData()"><div class="form-group"><label class="control-label col-sm-4">mobileId</label><div class="col-sm-5"><input type="password"  class="form-control" name="mobile_id" id="mobile_id" tabindex="1" pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$" title="Only alphanumeric allow." required maxlength="122"  /><input type="checkbox" onclick="showPassword('mobile_id')" >Show Password</div></div><div class="form-group"><label class="control-label col-sm-4">MobileDes</label><div class="col-sm-5"><textarea name="Mobile_Des" id="Mobile_Des"  class="form-control" placeholder="Enter text..." rows="5" cols="30" tabindex="2" required pattern="^[A-Za-z0-9]{1}[A-Za-z0-9\s]{0,}$" maxlength="13"  ></textarea></div></div><div class="form-group"><label class="control-label col-sm-4">Hobbies</label><div class="col-sm-5"> <div class='row'> <div class='col-sm-6'><input type="checkbox" name="hobbeis" id="hobbeis1" tabindex="2" pattern=":pattern"  value=Cricket /> Cricket<br /></div> <div class='col-sm-6'><input type="checkbox" name="hobbeis" id="hobbeis2" tabindex="2" pattern=":pattern"  value=Music /> Music<br /></div></div></div></div><div class="form-group"><label class="control-label col-sm-4">date2</label><div class="col-sm-5"><input type="text"  class="form-control" name="date_2" id="date_2" tabindex="12" required onkeypress="return false;"  /></div></div><div class="form-group"><div class="col-sm-offset-4 col-sm-5"><input type="submit" class="btn btn-success" /></div></div></form><font color='red'><p id="errMessage"></p></font><c:if test="${not empty message}"><font color='green'><c:out value="${message }"></c:out></font></c:if><c:if test="${not empty errMessage}"><font color='red'> ${errMessage } </font></c:if></div><div class="container" style="overflow-x:auto;"><c:if test="${not empty listData}" >	<table class="table"> 	<thead style='color:#ccffe6;background-color:#87ceeb'>		<tr><th>mobileId</th><th>MobileDes</th><th>Hobbies</th><th>date2</th>	</tr></thead>	<c:forEach items="${listData}" var="obj">	<tbody><tr><td class="col-m-2"><c:out value="${obj.mobile_id}" /></td><td class="col-m-2"><c:out value="${obj.mobile_des}" /></td><td class="col-m-2"><c:out value="${obj.hobbeis}" /></td><td class="col-m-2"><c:out value="${obj.date_2}" /></td>	</tr></tbody>	</c:forEach></table></c:if></div></body><script src="../js/formutility_date.js"></script><script>function checkFormData() {if(!$('input[name=hobbeis]:checked').length > 0) {document.getElementById("errMessage").innerHTML = "Hobbies can not be null";return false;}return true; }</script><script>$('#date_2').datetimepicker({timepicker:false,format: 'Y-m-d',formatDate : 'Y-m-d',});</script></html>
