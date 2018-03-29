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
@Table(name="demoTable") 
public class DemoTable implements Serializable {
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
 @Column(name="code")
 private String code ; 
 
public String getCode() { 
 return code; 
} 
public void setCode(String code) { 
this.code = code; 
} 
@javax.validation.constraints.NotNull(message="checkin can not be null")

 @Column(name="checkin")
 private java.sql.Timestamp checkin ; 
 
public java.sql.Timestamp getCheckin() { 
 return checkin; 
} 
public void setCheckin(java.sql.Timestamp checkin) { 
this.checkin = checkin; 
} 
@javax.validation.constraints.NotNull(message="Gender can not be null")
 @Column(name="gender")
 private String gender ; 
 
public String getGender() { 
 return gender; 
} 
public void setGender(String gender) { 
this.gender = gender; 
} 
@javax.validation.constraints.NotNull(message="dob can not be null")

 @Column(name="dob")
 private java.sql.Date dob ; 
 
public java.sql.Date getDob() { 
 return dob; 
} 
public void setDob(java.sql.Date dob) { 
this.dob = dob; 
} 
@javax.validation.constraints.NotNull(message="pwd can not be null")
 @Column(name="pwd")
 private String pwd ; 
 
public String getPwd() { 
 return pwd; 
} 
public void setPwd(String pwd) { 
this.pwd = pwd; 
} 
@javax.validation.constraints.NotNull(message="address can not be null")
 @Column(name="adr")
 private String adr ; 
 
public String getAdr() { 
 return adr; 
} 
public void setAdr(String adr) { 
this.adr = adr; 
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
  return  "-> ID : "+ID+"-> code : "+code+"-> checkin : "+checkin+"-> gender : "+gender+"-> dob : "+dob+"-> pwd : "+pwd+"-> adr : "+adr+" "; 
	}
 }
