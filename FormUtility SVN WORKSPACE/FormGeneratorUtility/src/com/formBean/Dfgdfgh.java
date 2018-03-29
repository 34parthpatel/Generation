package com.formBean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Future;
import javax.validation.constraints.Pattern;
import javax.persistence.Table;

import com.sttl.hibernate.custom.validation.RangeValidation;

@Entity
@Table(name = "dfgdfgh")
public class Dfgdfgh implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	Integer ID;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	@Column(name = "fghfgh")
	Integer fghfgh;

	public Integer getFghfgh() {
		return fghfgh;
	}

	public void setFghfgh(Integer fghfgh) {
		this.fghfgh = fghfgh;
	}

	@javax.validation.constraints.NotNull(message = "date1 can not be null")
	@javax.validation.constraints.Future(message = "sdgg date must be in future")
	@Column(name = "date1")
	java.sql.Date date1;

	public java.sql.Date getDate1() {
		return date1;
	}

	public void setDate1(java.sql.Date date1) {
		this.date1 = date1;
	}

	@Override
	public String toString() {
		return "-> ID : " + ID + "-> fghfgh : " + fghfgh + "-> date1 : "
				+ date1 + " ";
	}
}
