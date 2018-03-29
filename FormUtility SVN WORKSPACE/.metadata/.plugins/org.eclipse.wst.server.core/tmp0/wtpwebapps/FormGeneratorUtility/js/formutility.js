

function dropForm(id)
{
	var val = confirm("Are you sure want to drop page?");
	if(val == true)
	{
		return true;
	}
	return false;
}

/*$("#password").password('toggle');*/

function checkForm() {
	/*var pageName = $("#pageName").val();
	if(pageName.trim() == null || pageName.trim() == "")
	{
		$("#errMsg").text("Please insert page name.");
		return false;
	}
	if(/[^a-zA-Z0-9_]/.test(pageName)) {
		$("#errMsg").text("Special characters and space not allow in Page Name / Table Name.");
	    return false;
	}
	
	var status = true;
	
	//var values = [];
	$('input[name="fld_lbl"]').each(function() {
	    //values.push($(this).val());
	    if($(this).val().trim() == null || $(this).val().trim() == "")
	    {
	    	$("#errMsg").text("Please insert proper data.");
	    	status = false;
	    }
	});
	
	$('input[name="fld_name"]').each(function() {
	    if($(this).val().trim() == null || $(this).val().trim() == "")
	    {
	    	$("#errMsg").text("Please insert proper data.");
	    	status = false;
	    }
	});
	
	$('input[name="fld_index"]').each(function() {
	    if($(this).val().trim() == null || $(this).val().trim() == "")
	    {
	    	$("#errMsg").text("Please insert proper data.");
	    	status = false;
	    }
	});
	
	$('input[name="fld_name"]').each(function() {
	    if($(this).val().trim().toLowerCase() == 'id')
	    {
	    	$("#errMsg").text("ID field can not be inserted, Its By default!");
	    	status = false;
	    }
	});
	
	$('.txt_area_val').each(function(){
	    if($(this).val().trim().length < 2){
	        $("#errMsg").text("Please insert proper data.");
	        status = false;
	    }
	});
	
	if(!status)
	{
		return false;
	}*/
	
	return true;
}

function showPassword(id) {
    var x = document.getElementById(id);
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

var a = ['','one ','two ','three ','four ', 'five ','six ','seven ','eight ','nine ','ten ','eleven ','twelve ','thirteen ','fourteen ','fifteen ','sixteen ','seventeen ','eighteen ','nineteen '];
var b = ['', '', 'twenty','thirty','forty','fifty', 'sixty','seventy','eighty','ninety'];

function inWords (num) {
    if ((num = num.toString()).length > 9) return 'overflow';
    n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
    if (!n) return; var str = '';
    str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'crore ' : '';
    str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'lakh ' : '';
    str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'thousand ' : '';
    str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'hundred ' : '';
    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + ' ' : '';
    return str;
}

function download(name) {
	/*var val = confirm("Do you want to download file?");
	if(val == true)
	{*/
    	console.log(name);
    	var xhr = new XMLHttpRequest();
		xhr.open('POST', "../downloadFile/file_demo4", true);
		xhr.responseType = 'arraybuffer';
		xhr.onload = function () {
		    if (this.status === 200) {
		        var filename = "";
		        var disposition = xhr.getResponseHeader('Content-Disposition');
		        if (disposition && disposition.indexOf('attachment') !== -1) {
		            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
		            var matches = filenameRegex.exec(disposition);
		            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
		        }
		        var type = xhr.getResponseHeader('Content-Type');
		        var blob = typeof File === 'function'
		            ? new File([this.response], filename, { type: type })
		            : new Blob([this.response], { type: type });
		        if (typeof window.navigator.msSaveBlob !== 'undefined') {
		            window.navigator.msSaveBlob(blob, filename);
		        } else {
		            var URL = window.URL || window.webkitURL;
		            var downloadUrl = URL.createObjectURL(blob);
	
		            if (filename) {
		                var a = document.createElement("a");
		                if (typeof a.download === 'undefined') {
		                    window.location = downloadUrl;
		                } else {
		                    a.href = downloadUrl;
		                    a.download = filename;
		                    document.body.appendChild(a);
		                    a.click();
		                }
		            } else {
		                window.location = downloadUrl;
		            }
		            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
		        }
		    }
		};
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send($.param({
			"fileId" : name
		}));
	/*}*/
}


function checkFileType(id)
{
	//alert(id);
	var control = document.getElementById(id);
	console.log(control);
	//control.addEventListener("change", function(event) {
		returnType = true;
		var files = control.files;
		for (var i = 0; i < files.length; i++) {
			var blob = files[i];
			var fileReader = new FileReader();
			var header = "";
			
			fileReader.onload = function(e) {
				header = "";
				var arr = (new Uint8Array(e.target.result)).subarray(0, 4);
				  console.log(arr + " - " + fileReader.result);
				  for(var i = 0; i < arr.length; i++) {
					 header += arr[i].toString(16);
				  }
				  console.log(header);
				  switch (header) {
					case "89504e47":
						type = "image/png";
						errMessage = "";
						break;
					case "47494638":
						type = "image/gif";
						errMessage = "GIF not allow.";
						returnType = false;
						break;
					case "ffd8ffe0":
					case "ffd8ffe1":
					case "ffd8ffe2":
					case "ffd8ffe3":
					case "ffd8ffe8":
						type = "image/jpeg";
						errMessage = "";
						break;
					case "25504446":
						type = "application/pdf";
						errMessage = "";
						break;
					default:
						type = "unknown";
						errMessage = "Unknown type";
						returnType = false;
						break;
				}
			};
			
			fileReader.readAsArrayBuffer(blob);
			
			console.log(blob.type);
			console.log("Filename: " + files[i].name);
			console.log("Type: " + files[i].type);
			console.log("Size: " + files[i].size + " bytes");
		}
	//});
}

$.validator.addMethod('filesize', function (value, element, param) {
	console.log("- " + element.files.length);
	var size = 0;
	for(var i=0;i<element.files.length;i++) {
		size += element.files[i].size;
	}
	console.log(size);
	if(!element.files[0]) {
		console.log("----");
	} else {
		console.log(element.files[0] + " : " + size + " : " + param);
	}
    return this.optional(element) || (size <= param)
}, 'File size must be less than {0} bytes');

$.validator.addMethod('parth', function (value, element, param) {
	console.log("parth " + value);
	console.log("parth- " + element.files.length);
    return this.optional(element);
}, 'File size must be less than {0} bytes');

