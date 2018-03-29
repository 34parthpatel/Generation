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
@Table(name = "DEMO111")
public class DEMO111 implements Serializable {
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

	@javax.validation.constraints.NotNull(message = "dfd1 can not be null")
	@org.hibernate.validator.constraints.Range(min = 1, message = "dfd1 can not be null")
	@Column(name = "gfg")
	private Integer gfg;

	public Integer getGfg() {
		return gfg;
	}

	public void setGfg(Integer gfg) {
		this.gfg = gfg;
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
		return "-> ID : " + ID + "-> gfg : " + gfg + " ";
	}
}
