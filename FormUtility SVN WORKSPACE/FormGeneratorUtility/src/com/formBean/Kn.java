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
@Table(name="kn") 
public class Kn implements Serializable {
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
@javax.validation.constraints.NotNull(message="lm can not be null")
 @Column(name="lm")
Integer lm ; 
 
public Integer getLm() { 
 return lm; 
} 
public void setLm(Integer lm) { 
this.lm = lm; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> lm : "+lm+" "; 
	}
 }
