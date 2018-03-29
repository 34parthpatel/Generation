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
@Table(name="Demo") 
public class Demo implements Serializable {
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
@org.hibernate.validator.constraints.Length(max=10, message ="code Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$",message="Enter proper code.") @Column(name="code")
String code ; 
 
public String getCode() { 
 return code; 
} 
public void setCode(String code) { 
this.code = code; 
} 
@javax.validation.constraints.NotNull(message="num can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="num can not be null") @Column(name="num")
Integer num ; 
 
public Integer getNum() { 
 return num; 
} 
public void setNum(Integer num) { 
this.num = num; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> code : "+code+"-> num : "+num+" "; 
	}
 }
