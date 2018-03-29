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
@Table(name="demo44") 
public class Demo44 implements Serializable {
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
@javax.validation.constraints.NotNull(message="dt can not be null")

@javax.validation.constraints.Future(message="dt date must be in future")
 @Column(name="dt")
 private java.sql.Timestamp dt ; 
 
public java.sql.Timestamp getDt() { 
 return dt; 
} 
public void setDt(java.sql.Timestamp dt) { 
this.dt = dt; 
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
@javax.validation.constraints.NotNull(message="dob can not be null")

@javax.validation.constraints.Past(message="date of birth date must be in past") 
 @Column(name="dob")
 private java.sql.Date dob ; 
 
public java.sql.Date getDob() { 
 return dob; 
} 
public void setDob(java.sql.Date dob) { 
this.dob = dob; 
} 
@javax.validation.constraints.NotNull(message="name can not be null")
@org.hibernate.validator.constraints.Length(max=15, message ="name Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z]{0,}$",message="Enter proper name.") @Column(name="name")
 private String name ; 
 
public String getName() { 
 return name; 
} 
public void setName(String name) { 
this.name = name; 
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
  return  "-> ID : "+ID+"-> dt : "+dt+"-> code : "+code+"-> dob : "+dob+"-> name : "+name+" "; 
	}
 }
