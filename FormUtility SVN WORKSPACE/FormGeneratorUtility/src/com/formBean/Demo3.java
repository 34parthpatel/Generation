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
@Table(name="demo3") 
public class Demo3 implements Serializable {
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
@javax.validation.constraints.NotNull(message="code can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="code can not be null") @Column(name="code")
Integer code ; 
 
public Integer getCode() { 
 return code; 
} 
public void setCode(Integer code) { 
this.code = code; 
} 
@javax.validation.constraints.NotNull(message="Gender can not be null")
@org.hibernate.validator.constraints.Length(max=6, message ="Gender Data must be in Proper length.")
 @Column(name="gender")
String gender ; 
 
public String getGender() { 
 return gender; 
} 
public void setGender(String gender) { 
this.gender = gender; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> code : "+code+"-> gender : "+gender+" "; 
	}
 }
