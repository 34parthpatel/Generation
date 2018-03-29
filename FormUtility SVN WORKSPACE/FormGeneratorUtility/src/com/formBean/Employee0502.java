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
@Table(name = "employee0502")
public class Employee0502 implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer ID;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	@Column(name = "password")
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@javax.validation.constraints.NotNull(message = "code can not be null")
	@org.hibernate.validator.constraints.Range(min = 1, message = "code can not be null")
	@Column(name = "code")
	private Integer code;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	@javax.validation.constraints.NotNull(message = "Gender can not be null")
	@org.hibernate.validator.constraints.Length(max = 6, message = "Gender Data must be in Proper length.")
	@Column(name = "gender")
	private String gender;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@javax.validation.constraints.NotNull(message = "demoField can not be null")
	@org.hibernate.validator.constraints.Length(max = 5, message = "demoField Data must be in Proper length.")
	@Pattern(regexp = "^[A-Za-z]{0,}$", message = "Enter proper demoField.")
	@Column(name = "demofield")
	private String demofield;

	public String getDemofield() {
		return demofield;
	}

	public void setDemofield(String demofield) {
		this.demofield = demofield;
	}

	@javax.validation.constraints.NotNull(message = "number can not be null")
	@org.hibernate.validator.constraints.Range(min = 1, message = "number can not be null")
	@Column(name = "num1")
	private Integer num1;

	public Integer getNum1() {
		return num1;
	}

	public void setNum1(Integer num1) {
		this.num1 = num1;
	}

	@javax.validation.constraints.NotNull(message = "check can not be null")
	@org.hibernate.validator.constraints.Length(max = 7, message = "check Data must be in Proper length.")
	@Column(name = "box")
	private String box;

	public String getBox() {
		return box;
	}

	public void setBox(String box) {
		this.box = box;
	}

	@Column(name = "combobox")
	private String combobox;

	public String getCombobox() {
		return combobox;
	}

	public void setCombobox(String combobox) {
		this.combobox = combobox;
	}

	@Transient
	private String edit;

	public String getEdit() {
		return "<a href='#' onclick=\"editRow('" + ID + "')\" >Edit</a>";
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	@Transient
	private String delete;

	public String getDelete() {
		return "<a href='#' onclick=\"deleteRow('" + ID + "')\" >Delete</a>";
	}

	public void setDelete(String edit) {
		this.edit = edit;
	}

	@Override
	public String toString() {
		return "-> ID : " + ID + "-> password : " + password + "-> code : "
				+ code + "-> gender : " + gender + "-> demofield : "
				+ demofield + "-> num1 : " + num1 + "-> box : " + box
				+ "-> combobox : " + combobox + " ";
	}
}
