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
@Table(name="textbox") 
public class Textbox implements Serializable {
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
 @Column(name="jhg")
Integer jhg ; 
 
public Integer getJhg() { 
 return jhg; 
} 
public void setJhg(Integer jhg) { 
this.jhg = jhg; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> jhg : "+jhg+" "; 
	}
 }
