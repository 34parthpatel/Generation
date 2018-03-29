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
@Table(name="temp_emp") 
public class Temp_emp implements Serializable {
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
@javax.validation.constraints.NotNull(message="password can not be null")@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z].*[A-Z])(?=.*[@#$%^&+=].*[@#$%^&+=])(?=\\S+$).{8,}",message="Enter proper password.")
 @Column(name="password")
String password ; 
 
public String getPassword() { 
 return password; 
} 
public void setPassword(String password) { 
this.password = password; 
} 
  @Column(name="name")
String name ; 
 
public String getName() { 
 return name; 
} 
public void setName(String name) { 
this.name = name; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> password : "+password+"-> name : "+name+" "; 
	}
 }
