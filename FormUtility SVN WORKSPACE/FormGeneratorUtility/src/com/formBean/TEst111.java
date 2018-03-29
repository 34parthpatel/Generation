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
 import javax.persistence.Transient; 
@Entity 
@Table(name="TEst111") 
public class TEst111 implements Serializable {
	@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)
 @Column(name="ID")
 private Integer ID ; 
 
public Integer getID() { 
 return ID; 
} 
public void setID(Integer ID) { 
this.ID = ID; 
} 
@javax.validation.constraints.NotNull(message="code can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="code can not be null") @Column(name="test")
 private Integer test ; 
 
public Integer getTest() { 
 return test; 
} 
public void setTest(Integer test) { 
this.test = test; 
} 
@javax.validation.constraints.NotNull(message="Radio can not be null")
@org.hibernate.validator.constraints.Length(max=6, message ="Radio Data must be in Proper length.")
 @Column(name="gender")
 private String gender ; 
 
public String getGender() { 
 return gender; 
} 
public void setGender(String gender) { 
this.gender = gender; 
} 
@javax.validation.constraints.NotNull(message="Hobbies can not be null")
@org.hibernate.validator.constraints.Length(max=22, message ="Hobbies Data must be in Proper length.")
 @Column(name="hob")
 private String hob ; 
 
public String getHob() { 
 return hob; 
} 
public void setHob(String hob) { 
this.hob = hob; 
} 

 @Transient 
private String edit ;public String getEdit() { 
return "<a href='#' onclick=\"editRow('"+ID+"')\" >Edit</a>";
 }
public void setEdit(String edit) { 
	this.edit = edit; 
}

 @Transient 
private String delete ;public String getDelete() { 
return "<a href='#' onclick=\"deleteRow('"+ID+"')\" >Delete</a>";
 }
public void setDelete(String edit) { 
	this.edit = edit; 
}
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> test : "+test+"-> gender : "+gender+"-> hob : "+hob+" "; 
	}
 }
