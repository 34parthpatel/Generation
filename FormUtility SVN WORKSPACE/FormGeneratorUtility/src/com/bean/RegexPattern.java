package com.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="regex_pattern")
@NamedQuery(name="RegexPattern.findAll", query="SELECT r FROM RegexPattern r")
public class RegexPattern implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "increment", strategy = "org.hibernate.id.IncrementGenerator")
	@GeneratedValue(generator = "increment")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="pattern")
	private String pattern;
	
	@Column(name="massage")
	private String massage;
	
	@Column(name="module")
	private String module;
	
	public RegexPattern() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public String getMassage() {
		return massage;
	}

	public void setMassage(String massage) {
		this.massage = massage;
	}
	
	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "id " + id +" pattern " + pattern +"\n";
	}
}
