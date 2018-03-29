<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="datatableEditorLib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css">
<link rel="stylesheet" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
var editor; // use a global for the submit and return data rendering in the examples

$(document).ready(function () {
    editor = new $.fn.dataTable.Editor( {
                bServerSide: true,
                table: "#payers",
                fields: [ {
                        label: "PUID:",
                        name: "id"
                    },
                    {
                        label: "Payer ID:",
                        name: "payerID"
                    }, {
                        label: "Payer Name:",
                        name: "payerName"
                    }, {
                        label: "Contract ID:",
                        name: "contractID"
                    }, {
                        label: "Ins Co:",
                        name: "insCo"
                    }, {
                        label: "Ins Type:",
                        name: "insType"
                    }, {
                        label: "Ins Group ID:",
                        name: "groupID"
                    }, {
                        label: "Effective:",
                        name: "eff",
                        type: "date"
                    }, {
                        label: "Termination:",
                        name: "term",
                        type: "date"
                    }
                ]
                
    } );
 
    $('#payers').DataTable( {
        type: 'POST',
        bServerSide: true,
        sAjaxSource: "dataTable",
        bProcessing: true,
        spagingType: 'full_numbers',
        "bJQueryUI": true,
 
        aoColumns: [
                      { "sInt": "id",
                            "bSearchable": false,
                            "bSortable": false,
                            "bVisible": false  },
                      { "sName": "payerID" },
                      { "sName": "payerName" },
                      { "sName": "contractID" },
                      { "sName": "insCo" },
                      { "sName": "insType" },
                      { "sName": "groupID" },
                      { "sName": "eff" },
                      { "sName": "term" }
                     ],
       columnDefs: [
                     { "targets": "contractID", 
                       "defaultContent": "",
                     },
                     { "targets": "insCo", 
                         "defaultContent": "",
                       },
                     { "targets": "insType",
                         "defaultContent": "",
                     },
                     { "targets": "groupID",
                         "defaultContent": "",
                     }
                   ],                    
       "tableTools": {
           sRowSelect: "os",
           "aButtons": [
               { sExtends: "editor_create", editor: editor },
               { sExtends: "editor_edit",   editor: editor },
               { sExtends: "editor_remove", editor: editor }
           ]
       }
     } ); 
    $("div.toolbar").append('<div class="btn-group" style="padding:5px "><button class="btn btn-default" id="refreshbtn" style="background:none;border:1px solid #ccc;height:30px" type="button"><span class="glyphicon glyphicon-refresh" style="padding:3px"></span></button></div>');
    $("div.toolbar").css("float","right");
    $('#refreshbtn').click(function()
    {
        "#payers".fnStandingRedraw();
    });
});
</script>
</head>
<body>
	<table id="example" class="stripe row-border order-column" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>First name</th>
                <th>Last name</th>
                <th>Updated date</th>
                <th>Registered date</th>
            </tr>
        </thead>
    </table>
</body>
</html>