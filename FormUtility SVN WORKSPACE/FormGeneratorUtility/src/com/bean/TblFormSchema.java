package com.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.GenericGenerator;

import com.sttl.hibernate.custom.validation.ValueValidationBaseOnType;


/**
 * The persistent class for the tbl_form_schema database table.
 * 
 */
@Entity
@Table(name="tbl_form_schema")
@NamedQuery(name="TblFormSchema.findAll", query="SELECT t FROM TblFormSchema t")
@ValueValidationBaseOnType(controller="fieldController",dataType="fieldType",value="fieldValue")
public class TblFormSchema implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "increment", strategy = "org.hibernate.id.IncrementGenerator")
	@GeneratedValue(generator = "increment")
	private Integer id;

	@Column(name="field_controller")
	private String fieldController;

	@Pattern(regexp="^[A-Za-z0-9]{1}[A-Za-z0-9\\s]{0,}$" , message="Field Lable is invalid")
	@Column(name="field_label")
	private String fieldLabel;

	@Pattern(regexp="^[A-Za-z_]{1}[A-Za-z0-9_]{0,}$" , message="Field Name is invalid")
	@Column(name="field_name")
	private String fieldName;
	
	@Column(name="field_value")
	private String fieldValue;
	
	@Column(name="field_type")
	private String fieldType;
	
	@Column(name="field_index")
	 private int fieldIndex;
	
	@Pattern(regexp="^((?!Please select).)*$" , message="Please select not allowed as Regex")
	@Column(name="regex")
	private String regex;
	
	@Column(name="tooltip")
	private String tooltip;
	
	@Column(name="start_date")
	private String startDate;
	
	@Column(name="end_date")
	private String endDate;
	
	@Column(name="date_format")
	private String dateFormat;
	
	@Column(name="date_all")
	private String dateAll;
	
	@Column(name="date_past")
	private String datePast;
	
	@Column(name="date_future")
	private String dateFuture;
	
	@Column(name="required")
	private String required;
	
	private int fk;
	//I have start with zero because when date is selecet at that time size have zero size so i have to start with zero
	@Pattern(regexp="^[0-9]{1,}([,][0-9])?$" , message="Field size is invalid")
	private String size;

	public TblFormSchema() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFieldController() {
		return this.fieldController;
	}

	public void setFieldController(String fieldController) {
		this.fieldController = fieldController;
	}

	public String getFieldLabel() {
		return this.fieldLabel;
	}

	public void setFieldLabel(String fieldLabel) {
		this.fieldLabel = fieldLabel;
	}

	public String getFieldName() {
		return this.fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public int getFk() {
		return this.fk;
	}

	public void setFk(int fk) {
		this.fk = fk;
	}

	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public int getFieldIndex() {
		return fieldIndex;
	}

	public void setFieldIndex(int fieldIndex) {
		this.fieldIndex = fieldIndex;
	}

	public String getRegex() {
		return regex;
	}

	public void setRegex(String regex) {
		this.regex = regex;
	}

	public String getTooltip() {
		return tooltip;
	}

	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDateFormat() {
		return dateFormat;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}

	public String getDateAll() {
		return dateAll;
	}

	public void setDateAll(String dateAll) {
		this.dateAll = dateAll;
	}

	public String getDatePast() {
		return datePast;
	}

	public void setDatePast(String datePast) {
		this.datePast = datePast;
	}

	public String getDateFuture() {
		return dateFuture;
	}

	public void setDateFuture(String dateFuture) {
		this.dateFuture = dateFuture;
	}

	
	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "fieldn name : "+ fieldName + ", Field regex : " + regex + ", Date format : " + dateFormat + "  -> value "+ fieldValue;
	}
	
}