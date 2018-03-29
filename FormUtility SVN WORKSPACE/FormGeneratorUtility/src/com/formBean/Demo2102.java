package com.formBean;  
import java.io.Serializable; 
import javax.persistence.Column;
 import javax.persistence.Entity; 
 import javax.persistence.GeneratedValue;
 import javax.persistence.GenerationType; 
 import javax.persistence.Id; 
 import javax.validation.constraints.Pattern; 
 import javax.persistence.Table; 
 import com.sttl.hibernate.custom.validation.RangeValidation; 
 import javax.persistence.Transient; 
@Entity 
@Table(name="demo2102") 
public class Demo2102 implements Serializable {
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
 @Column(name="ID")
 private Integer ID ; 
 
public Integer getID() { 
 return ID; 
} 
public void setID(Integer ID) { 
this.ID = ID; 
} 
@javax.validation.constraints.NotNull(message="code can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="code can not be null") @Column(name="code")
 private Integer code ; 
 
public Integer getCode() { 
 return code; 
} 
public void setCode(Integer code) { 
this.code = code; 
} 
@javax.validation.constraints.NotNull(message = "Aadhar is required")
 @Column(name = "aadhar") 
private String aadhar ;public String getAadhar() { 
if(aadhar == null || aadhar.equals("")) { return "Aadhar"; } return "<a href='#' onclick=\"downloadFile('"+aadhar+"')\">Aadhar</a>";
 }
public void setAadhar(String aadhar) { 
	this.aadhar = aadhar; 
}
@javax.validation.constraints.NotNull(message = "Pan is required")
 @Column(name = "pan") 
private String pan ;public String getPan() { 
if(pan == null || pan.equals("")) { return "Pan"; } return "<a href='#' onclick=\"downloadFile('"+pan+"')\">Pan</a>";
 }
public void setPan(String pan) { 
	this.pan = pan; 
}

 @Transient 
private String edit ;public String getEdit() { 
return "<a href='#' onclick=\"editRow('"+ID+"')\" >Edit</a>";
 }
public void setEdit(String edit) { 
	this.edit = edit; 
}

 @Transient 
private String delete ;public String getDelete() { 
return "<a href='#' onclick=\"deleteRow('"+ID+"')\" >Delete</a>";
 }
public void setDelete(String edit) { 
	this.edit = edit; 
}
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> code : "+code+"-> aadhar : "+aadhar+"-> pan : "+pan+" "; 
	}
 }
