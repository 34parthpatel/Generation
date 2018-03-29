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
@Table(name="hrtfyrty") 
public class Hrtfyrty implements Serializable {
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
@javax.validation.constraints.NotNull(message="rtyrty can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="rtyrty can not be null") @Column(name="rtyrty")
Integer rtyrty ; 
 
public Integer getRtyrty() { 
 return rtyrty; 
} 
public void setRtyrty(Integer rtyrty) { 
this.rtyrty = rtyrty; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> rtyrty : "+rtyrty+" "; 
	}
 }
