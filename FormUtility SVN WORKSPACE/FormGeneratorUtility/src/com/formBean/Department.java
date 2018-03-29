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
@Table(name="Department") 
public class Department implements Serializable {
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
@javax.validation.constraints.NotNull(message="data can not be null")
 @Column(name="dt1")
 private Float dt1 ; 
 
public Float getDt1() { 
 return dt1; 
} 
public void setDt1(Float dt1) { 
this.dt1 = dt1; 
} 
@javax.validation.constraints.NotNull(message="password can not be null")@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\\S+$).{8,}",message="Enter proper password.")
 @Column(name="password")
 private String password ; 
 
public String getPassword() { 
 return password; 
} 
public void setPassword(String password) { 
this.password = password; 
} 
@javax.validation.constraints.NotNull(message="Project name can not be null")
@org.hibernate.validator.constraints.Length(max=49, message ="Project name Data must be in Proper length.")
 @Column(name="projectname")
 private String projectname ; 
 
public String getProjectname() { 
 return projectname; 
} 
public void setProjectname(String projectname) { 
this.projectname = projectname; 
} 
@javax.validation.constraints.NotNull(message="Address can not be null")
@org.hibernate.validator.constraints.Length(max=150, message ="Address Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$",message="Enter proper Address.") @Column(name="address")
 private String address ; 
 
public String getAddress() { 
 return address; 
} 
public void setAddress(String address) { 
this.address = address; 
} 
@javax.validation.constraints.NotNull(message="Gender can not be null")
@org.hibernate.validator.constraints.Length(max=6, message ="Gender Data must be in Proper length.")
 @Column(name="gender")
 private String gender ; 
 
public String getGender() { 
 return gender; 
} 
public void setGender(String gender) { 
this.gender = gender; 
} 
@javax.validation.constraints.NotNull(message="Dept Name can not be null")
@org.hibernate.validator.constraints.Length(max=15, message ="Dept Name Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$",message="Enter proper Dept Name.") @Column(name="dept_name")
 private String dept_name ; 
 
public String getDept_name() { 
 return dept_name; 
} 
public void setDept_name(String dept_name) { 
this.dept_name = dept_name; 
} 
@javax.validation.constraints.NotNull(message="Number can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="Number can not be null") @Column(name="number1")
 private Integer number1 ; 
 
public Integer getNumber1() { 
 return number1; 
} 
public void setNumber1(Integer number1) { 
this.number1 = number1; 
} 
@javax.validation.constraints.NotNull(message="date1 can not be null")

@RangeValidation(endDate="2017-12-13 16:55" ,startDate="2017-12-15 16:55", message = "Date1 must be in range (2017-12-13 16:55 to 2017-12-15 16:55 )") @Column(name="date1")
 private java.sql.Date date1 ; 
 
public java.sql.Date getDate1() { 
 return date1; 
} 
public void setDate1(java.sql.Date date1) { 
this.date1 = date1; 
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
  return  "-> ID : "+ID+"-> dt1 : "+dt1+"-> password : "+password+"-> projectname : "+projectname+"-> address : "+address+"-> gender : "+gender+"-> dept_name : "+dept_name+"-> number1 : "+number1+"-> date1 : "+date1+" "; 
	}
 }
