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
@Table(name="oraganization") 
public class Oraganization implements Serializable {
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
 @Column(name="dt")
java.sql.Date dt ; 
 
public java.sql.Date getDt() { 
 return dt; 
} 
public void setDt(java.sql.Date dt) { 
this.dt = dt; 
} 
@javax.validation.constraints.NotNull(message="Address can not be null")
@org.hibernate.validator.constraints.Length(max=250, message ="Address Data must be in Proper length.")
@Pattern(regexp="^[a-z]$",message="Enter proper Address.") @Column(name="address")
String address ; 
 
public String getAddress() { 
 return address; 
} 
public void setAddress(String address) { 
this.address = address; 
} 
@javax.validation.constraints.NotNull(message="orgid can not be null")
@org.hibernate.validator.constraints.Range(min=1,message="orgid can not be null") @Column(name="org_id")
Integer org_id ; 
 
public Integer getOrg_id() { 
 return org_id; 
} 
public void setOrg_id(Integer org_id) { 
this.org_id = org_id; 
} 
@javax.validation.constraints.NotNull(message="checkbox2 can not be null")
@org.hibernate.validator.constraints.Length(max=12, message ="checkbox2 Data must be in Proper length.")
 @Column(name="checkbox2")
String checkbox2 ; 
 
public String getCheckbox2() { 
 return checkbox2; 
} 
public void setCheckbox2(String checkbox2) { 
this.checkbox2 = checkbox2; 
} 
 @Column(name="name")
String name ; 
 
public String getName() { 
 return name; 
} 
public void setName(String name) { 
this.name = name; 
} 
@javax.validation.constraints.NotNull(message="checkBox can not be null")
@org.hibernate.validator.constraints.Length(max=9, message ="checkBox Data must be in Proper length.")
 @Column(name="checkbox")
String checkbox ; 
 
public String getCheckbox() { 
 return checkbox; 
} 
public void setCheckbox(String checkbox) { 
this.checkbox = checkbox; 
} 
@javax.validation.constraints.NotNull(message="Radio2 can not be null")
@org.hibernate.validator.constraints.Length(max=6, message ="Radio2 Data must be in Proper length.")
 @Column(name="radio2")
String radio2 ; 
 
public String getRadio2() { 
 return radio2; 
} 
public void setRadio2(String radio2) { 
this.radio2 = radio2; 
} 
@javax.validation.constraints.NotNull(message="Description can not be null")
@org.hibernate.validator.constraints.Length(max=150, message ="Description Data must be in Proper length.")
@Pattern(regexp="^[a-z]$",message="Enter proper Description.") @Column(name="description")
String description ; 
 
public String getDescription() { 
 return description; 
} 
public void setDescription(String description) { 
this.description = description; 
} 
@javax.validation.constraints.NotNull(message="Combobox can not be null")
@org.hibernate.validator.constraints.Length(max=5, message ="Combobox Data must be in Proper length.")
 @Column(name="combobox")
String combobox ; 
 
public String getCombobox() { 
 return combobox; 
} 
public void setCombobox(String combobox) { 
this.combobox = combobox; 
} 
 @Column(name="radio")
String radio ; 
 
public String getRadio() { 
 return radio; 
} 
public void setRadio(String radio) { 
this.radio = radio; 
} 
	@Override 
	public String toString() { 
  return  "-> ID : "+ID+"-> dt : "+dt+"-> address : "+address+"-> org_id : "+org_id+"-> checkbox2 : "+checkbox2+"-> name : "+name+"-> checkbox : "+checkbox+"-> radio2 : "+radio2+"-> description : "+description+"-> combobox : "+combobox+"-> radio : "+radio+" "; 
	}
 }
