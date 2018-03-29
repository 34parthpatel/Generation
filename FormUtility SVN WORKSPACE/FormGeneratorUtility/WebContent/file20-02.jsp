<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="./datatable/js/jquery-1.12.4.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
        /* var files = null; // when files input changes this will be initiliazed.
        $(function() {
            $('#form2Submit').on('submit', uploadFile);
    	});

        function uploadFile(event) {
            event.stopPropagation();
            event.preventDefault();
            //var files = files;
            var form = document.getElementById('form2Submit');
            var data = new FormData(form);
            postFilesData(data);
		}

        function postFilesData(data) {
        	console.log(data);
            $.ajax({
                url :  './insert/Gautam_file_TEST',
                type : 'POST',
                data : data,
                cache : false,
                dataType : 'json',
                processData : false,
                contentType : false,
                success : function(data, textStatus, jqXHR) {
                    alert(data);
                },
                error : function(jqXHR, textStatus, errorThrown) {
                    alert('ERRORS: ' + textStatus);
                }
            });
        } */
        
        $(function() {
            $('#form2Submit').on('submit', uploadFile);
    	});
        
        function uploadFile() {
        	var form = document.getElementById('form2Submit');
            form.onsubmit = function() {
              var formData = new FormData(form);

              formData.append('fileSelect', fileSelect);

              var xhr = new XMLHttpRequest();
              // Add any event handlers here...
              xhr.open('POST', form.getAttribute('action'), true);
              xhr.send(formData);

              return false; // To avoid actual submission of the form
            }
        }
        
</script>
<body>
The html code can be something like following:

<form id ="form2Submit" action="../insert/Gautam_file_TEST" enctype="multipart/form-data" method="post">
  First name:<br>
  <input type="text" name="firstname" value="Mickey">
  <br>
  Last name:<br>
  <input type="text" name="lastname" value="Mouse">
  <br>
<input id="fileSelect" name="fileSelect[]" type="file" multiple >
<br>
  <input type="submit" value="Submit" id="submitform">
</form>
</body>
</html>