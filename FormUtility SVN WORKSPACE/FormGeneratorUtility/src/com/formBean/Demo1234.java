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
@Table(name="demo1234") 
public class Demo1234 implements Serializable {
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
@org.hibernate.validator.constraints.Range(min=1,message="code can not be null") @Column(name="emp_code")
 private Integer emp_code ; 
 
public Integer getEmp_code() { 
 return emp_code; 
} 
public void setEmp_code(Integer emp_code) { 
this.emp_code = emp_code; 
} 
@javax.validation.constraints.NotNull(message="address can not be null")
@org.hibernate.validator.constraints.Length(max=250, message ="address Data must be in Proper length.")
@Pattern(regexp="^[A-Za-z0-9,/-]{1,}$",message="Enter proper address.") @Column(name="address")
 private String address ; 
 
public String getAddress() { 
 return address; 
} 
public void setAddress(String address) { 
this.address = address; 
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
  return  "-> ID : "+ID+"-> emp_code : "+emp_code+"-> address : "+address+" "; 
	}
 }
