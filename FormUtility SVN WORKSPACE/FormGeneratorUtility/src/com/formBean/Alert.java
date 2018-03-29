package com.formBean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.sttl.hibernate.custom.validation.RangeValidation;

@Entity
@Table(name = "Alert")
public class Alert implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@javax.validation.constraints.NotNull(message = "ID can not be null")
	@Range(min = 1, message = "ID can not be null")
	@Column(name = "ID")
	Integer ID;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	@javax.validation.constraints.NotNull(message = "Name can not be null")
	@Length(max = 15, message = "Name Data must be in Proper length.")
	@Pattern(regexp = "^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$", message = "Enter proper Name.")
	@Column(name = "name")
	String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		System.out.println(" To String method " + ID + name);
		return "";
	}
}
