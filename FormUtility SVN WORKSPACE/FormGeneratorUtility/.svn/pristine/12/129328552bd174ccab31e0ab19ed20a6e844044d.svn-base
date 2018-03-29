package com.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="page_mapping")
public class PageMapping implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name = "increment", strategy = "org.hibernate.id.IncrementGenerator")
	@GeneratedValue(generator = "increment")
	private int id;

	@Pattern(regexp="^[A-z_]{1,}[A-z0-9_]{0,}" , message="PageName is invalid")
	@Column(name="page_name")
	private String pageName;
	
	//@Pattern(regexp="^[A-z0-9]{1,}[A-z0-9@#$%^&*()\\{\\}\\[\\]\\s,\".\'-_]{0,}" , message="Form Context Help is invalid")
	@Pattern(regexp="^[A-z0-9]{1,}([ \n\r\t].*){0,}" , message="Form Context Help is invalid")
	@Column(name="fromContext",length=1000)
	private String fromContextHelp;
	
	public PageMapping() {
		
	}
	public PageMapping(int id){
		this.id =  id;
	}
	public PageMapping(int id,String pageName){
		this.id = id;
		this.pageName = pageName;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPageName() {
		return pageName;
	}
	
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getFromContextHelp() {
		return fromContextHelp;
	}

	public void setFromContextHelp(String fromContextHelp) {
		this.fromContextHelp = fromContextHelp;
	}
	
	@Override
	public String toString()
	{
		return "ID -> " + id + " pageName - > " + pageName;
	}
}
