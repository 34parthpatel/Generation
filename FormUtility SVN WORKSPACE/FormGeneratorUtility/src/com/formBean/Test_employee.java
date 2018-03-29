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
 @Entity 
@Table(name="test_employee") 
public class Test_employee implements Serializable {
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
 @Column(name="ID")
Integer ID ; 
 
public Integer getID() { 
 return ID; 
} 
public void setID(Integer ID) { 
this.ID = ID; 
} 
 @Column(name="dt")
java.sql.Date dt ; 
 
public java.sql.Date getDt() { 
 return dt; 
} 
public void setDt(java.sql.Date dt) { 
this.dt = dt; 
} 
 @Column(name="password")
String password ; 
 
public String getPassword() { 
 return password; 
} 
public void setPassword(String password) { 
this.password = password; 
} 
 @Column(name="code")
Integer code ; 
 
public Integer getCode() { 
 return code; 
} 
public void setCode(Integer code) { 
this.code = code; 
} 
 @Column(name="gender")
String gender ; 
 
public String getGender() { 
 return gender; 
} 
public void setGender(String gender) { 
this.gender = gender; 
} 
@javax.validation.constraints.NotNull(message="Number can not be null")
 @Column(name="num")
Float num ; 
 
public Float getNum() { 
 return num; 
} 
public void setNum(Float num) { 
this.num = num; 
} 
 @Column(name="name")
String name ; 
 
public String getName() { 
 return name; 
} 
public void setName(String name) { 
this.name = name; 
} 
 @Column(name="project")
String project ; 
 
public String getProject() { 
 return project; 
} 
public void setProject(String project) { 
this.project = project; 
} 
 @Column(name="dept")
String dept ; 
 
public String getDept() { 
 return dept; 
} 
public void setDept(String dept) { 
this.dept = dept; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> dt : "+dt+"-> password : "+password+"-> code : "+code+"-> gender : "+gender+"-> num : "+num+"-> name : "+name+"-> project : "+project+"-> dept : "+dept+" "; 
	}
 }
