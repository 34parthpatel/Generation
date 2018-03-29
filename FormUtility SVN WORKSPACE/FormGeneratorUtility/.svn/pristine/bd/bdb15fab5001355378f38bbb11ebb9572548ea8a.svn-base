package com.bean;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the html_elements database table.
 * 
 */
@Entity
@Table(name="html_elements")
@NamedQuery(name="HtmlElement.findAll", query="SELECT h FROM HtmlElement h")
public class HtmlElement implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name = "increment", strategy = "org.hibernate.id.IncrementGenerator")
	@GeneratedValue(generator = "increment")
	private int id;

	@Column(name="element_name")
	private String elementName;

	public HtmlElement() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getElementName() {
		return this.elementName;
	}

	public void setElementName(String elementName) {
		this.elementName = elementName;
	}

}