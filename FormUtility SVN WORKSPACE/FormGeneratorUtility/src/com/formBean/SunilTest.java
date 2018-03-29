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
@Table(name="SunilTest") 
public class SunilTest implements Serializable {
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
 @Column(name="sunil")
String sunil ; 
 
public String getSunil() { 
 return sunil; 
} 
public void setSunil(String sunil) { 
this.sunil = sunil; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> sunil : "+sunil+" "; 
	}
 }
