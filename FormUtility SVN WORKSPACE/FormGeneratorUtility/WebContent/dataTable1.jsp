<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="datatableEditorLib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css">
<link rel="stylesheet" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css"> -->

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script> -->
<!-- <script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script> -->


<!-- <link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script> -->

<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var editor = new $.fn.dataTable.Editor( {
    ajax: "dataTable",
    table: "#users",
    fields: [
        { label: "First name:", name: "first_name" },
        { label: "Last name:",  name: "last_name" },
        { label: "Approved:",   name: "approved" }
    ]
});

var table = $('#users').DataTable( {
    /* dom: "Bfrtip", */
    dom: "Tfrtip",
    ajax: "dataTable",
    JQueryUI: true,
    columns: [
        { data: "first_name" },
        { data: "last_name" },
        { data: "approved" }
    ],
    select: true,
    buttons: [
        { extend: "create", editor: editor },
        { extend: "edit",   editor: editor },
        { extend: "remove", editor: editor }
    ]
} );
 
$('#users').on( 'click', 'tbody td', function () {
    editor.inline( this );
} );
 
$('#approve').on( 'click', function () {
    editor
        .edit( false )
        .val( 'approved', 1 )
        .submit();
} );
</script>
</body>
	<table id="users" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>First name</th>
                <th>Last name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>
        	<tr>
                <th>First </th>
                <th>Last </th>
                <th>Posi</th>
                <th>Offi</th>
                <th>Start </th>
                <th>Sal</th>
            </tr>
            <tr>
                <th>First </th>
                <th>Last </th>
                <th>Posit</th>
                <th>Offi</th>
                <th>Start </th>
                <th>Sala</th>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th>First name</th>
                <th>Last name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>
</html>