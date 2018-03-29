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
@Table(name="ghfgh") 
public class Ghfgh implements Serializable {
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
@javax.validation.constraints.NotNull(message="fgh can not be null")
@org.hibernate.validator.constraints.Length(max=6, message ="fgh Data must be in Proper length.")
@Pattern(regexp="^[1-9]{1,}[0-9]{0,}$",message="Enter proper fgh.") @Column(name="fghfgh")
String fghfgh ; 
 
public String getFghfgh() { 
 return fghfgh; 
} 
public void setFghfgh(String fghfgh) { 
this.fghfgh = fghfgh; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> fghfgh : "+fghfgh+" "; 
	}
 }
