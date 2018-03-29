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
@Table(name="File_test") 
public class File_test implements Serializable {
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
@javax.validation.constraints.NotNull(message = "all files is required")
 @Column(name = "all_files") 
private String all_files ;public String getAll_files() { 
if(all_files == null || all_files.equals("")) { return "All_files"; } return "<a href='#' onclick=\"downloadFile('"+all_files+"')\">All_files</a>";
 }
public void setAll_files(String all_files) { 
	this.all_files = all_files; 
}
@javax.validation.constraints.NotNull(message = "documents is required")
 @Column(name = "documents") 
private String documents ;public String getDocuments() { 
if(documents == null || documents.equals("")) { return "Documents"; } return "<a href='#' onclick=\"downloadFile('"+documents+"')\">Documents</a>";
 }
public void setDocuments(String documents) { 
	this.documents = documents; 
}
@javax.validation.constraints.NotNull(message="Name can not be null")
@org.hibernate.validator.constraints.Length(max=45, message ="Name Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z]{0,}$",message="Enter proper Name.") @Column(name="name")
 private String name ; 
 
public String getName() { 
 return name; 
} 
public void setName(String name) { 
this.name = name; 
} 
@javax.validation.constraints.NotNull(message = "uuid is required")
 @Column(name = "aadhar") 
private String aadhar ;public String getAadhar() { 
if(aadhar == null || aadhar.equals("")) { return "Aadhar"; } return "<a href='#' onclick=\"downloadFile('"+aadhar+"')\">Aadhar</a>";
 }
public void setAadhar(String aadhar) { 
	this.aadhar = aadhar; 
}
@javax.validation.constraints.NotNull(message = "pan is required")
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
  return  "-> ID : "+ID+"-> all_files : "+all_files+"-> documents : "+documents+"-> name : "+name+"-> aadhar : "+aadhar+"-> pan : "+pan+" "; 
	}
 }
