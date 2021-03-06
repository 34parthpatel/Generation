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
@Table(name = "Gautam_file_TEST")
public class Gautam_file_TEST implements Serializable {
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

	@javax.validation.constraints.NotNull(message = "CODE can not be null")
	@org.hibernate.validator.constraints.Range(min = 1, message = "CODE can not be null")
	@Column(name = "code")
	private Integer code;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	@javax.validation.constraints.NotNull(message = "INput File is required")
	@Column(name = "file")
	private String file;

	public String getFile() {
		if (file == null || file.equals("")) {
			return "FILE";
		}
		return "<a href='#' onclick=\"downloadFile('" + file + "')\">FILE</a>";
	}

	public void setFile(String file) {
		this.file = file;
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
		return "-> ID : " + ID + "-> code : " + code + "-> file : " + file
				+ " ";
	}
}
