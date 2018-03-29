package com.sttl.audit;

import javax.persistence.PostRemove;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;

public class HibernateEventListener {
	@PreUpdate
	public void userPreUpdate(Object ob) {
		System.out.println("Listening User Pre Update : " + ob);
	}
	@PostUpdate
	public void userPostUpdate(Object ob) {
		System.out.println("Listening User Post Update : " + ob);
	}
	@PreRemove
	public void userPreRemove(Object ob) {
		System.out.println("Listening User Pre Remove : " + ob);
	}
	@PostRemove
	public void userPostRemove(Object ob) {
		System.out.println("Listening User Post Remove : " + ob);
	}
}
