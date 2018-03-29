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
@Table(name="date_validation") 
public class Date_validation implements Serializable {
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
@javax.validation.constraints.NotNull(message="datetime1 can not be null")

@RangeValidation(endDate="2018-02-05 17:41" ,startDate="2018-02-24 17:41", message = "datetime must be in range (2018-02-05 17:41 to 2018-02-24 17:41 )") @Column(name="datetime1")
 private java.sql.Timestamp datetime1 ; 
 
public java.sql.Timestamp getDatetime1() { 
 return datetime1; 
} 
public void setDatetime1(java.sql.Timestamp datetime1) { 
this.datetime1 = datetime1; 
} 
@javax.validation.constraints.NotNull(message="date1 can not be null")

@RangeValidation(endDate="2018-02-06 17:41" ,startDate="2018-02-15 17:41", message = "date must be in range (2018-02-06 17:41 to 2018-02-15 17:41 )") @Column(name="date1")
 private java.sql.Date date1 ; 
 
public java.sql.Date getDate1() { 
 return date1; 
} 
public void setDate1(java.sql.Date date1) { 
this.date1 = date1; 
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
  return  "-> ID : "+ID+"-> datetime1 : "+datetime1+"-> date1 : "+date1+" "; 
	}
 }
