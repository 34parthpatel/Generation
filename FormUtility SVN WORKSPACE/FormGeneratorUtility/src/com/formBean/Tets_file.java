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
@Table(name="tets_file") 
public class Tets_file implements Serializable {
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

 @Column(name = "pan") 
private String pan ;public String getPan() { 
if(pan == null || pan.equals("")) { return "Pan"; } return "<a href='#' onclick=\"downloadFile('"+pan+"')\">Pan</a>";
 }
public void setPan(String pan) { 
	this.pan = pan; 
}
@javax.validation.constraints.NotNull(message = "uuid is required")
 @Column(name = "uuid") 
private String uuid ;public String getUuid() { 
if(uuid == null || uuid.equals("")) { return "Uuid"; } return "<a href='#' onclick=\"downloadFile('"+uuid+"')\">Uuid</a>";
 }
public void setUuid(String uuid) { 
	this.uuid = uuid; 
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
  return  "-> ID : "+ID+"-> code : "+code+"-> pan : "+pan+"-> uuid : "+uuid+" "; 
	}
 }
