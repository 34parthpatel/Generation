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
@Table(name="demo5") 
public class Demo5 implements Serializable {
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
@javax.validation.constraints.NotNull(message="demoField can not be null")
@org.hibernate.validator.constraints.Length(max=5, message ="demoField Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z]{0,}$",message="Enter proper demoField.") @Column(name="demofield")
String demofield ; 
 
public String getDemofield() { 
 return demofield; 
} 
public void setDemofield(String demofield) { 
this.demofield = demofield; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> code : "+code+"-> demofield : "+demofield+" "; 
	}
 }
