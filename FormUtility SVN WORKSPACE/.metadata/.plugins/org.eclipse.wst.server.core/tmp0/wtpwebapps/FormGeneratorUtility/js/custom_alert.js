function alertFuntion(){
	$('#alrtBtn').empty();
	if( arguments.length > 2){
		 $("#modelHeader").html(arguments[0]);
		  $("#modelBody").html(arguments[1]);	
	}
	 
	for (i = 2; i < arguments.length; i+=2) {
        
        if(arguments[i] == 'TYPE.success'){
   		 $("#alrtBtn").append(" <button type='button' class='btn btn-success' data-dismiss='modal' onclick='success()'>"+arguments[i+1]+"</button>");
   	 	}
        else if(arguments[i] == 'TYPE.cancle'){
      		 $("#alrtBtn").append(" <button type='button' class='btn btn-danger' data-dismiss='modal' onclick='cancle()'>"+arguments[i+1]+"</button>");
      	}
        else if(arguments[i] == 'TYPE.info'){
    		 $("#alrtBtn").append(" <button type='button' class='btn btn-info' data-dismiss='modal' onclick='info()'>"+arguments[i+1]+"</button>");
    	}else if(arguments[i] == 'TYPE.yes'){
     		 $("#alrtBtn").append(" <button type='button' class='btn btn-success' data-dismiss='modal' onclick='success()'>"+arguments[i+1]+"</button>");
     	}else if(arguments[i] == 'TYPE.no'){
     		 $("#alrtBtn").append(" <button type='button' class='btn btn-info' data-dismiss='modal'>"+arguments[i+1]+"</button>");
     	}else{
     		 $("#alrtBtn").append(" <button type='button' class='btn ' data-dismiss='modal'>"+arguments[i+1]+"</button>");
     	}
    } 
}