package com.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
/**
 * @author bhadresh.bajariya
 *
 */

@Entity
@Table(name = "auditlog_view")
public class AuditLogView implements  Comparable<AuditLogView>  {
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AUDIT_LOG_ID")
	private Integer auditLogId;
	
	@Column(name = "ACTIONS", nullable = false, length = 100)
	private String action;
	
	@Column(name = "DETAIL", nullable = false, length = 65535)
	private String detail;
	
	//@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE", nullable = false, length = 10)
	private Timestamp createdDate;
	
	@Column(name = "ENTITY_ID", nullable = false)
	private long entityId;
	
	@Column(name = "ENTITY_NAME", nullable = false)
	private String entityName;
	
	@Column(name = "IP_ADDRESS", nullable = false)
	private  String ipAddress;
	
	@Column(name = "MAC_ADDRESS", nullable = false)
	private  String macAddress;
	public AuditLogView() {
	}
	public AuditLogView(String action, String logDeatil, Timestamp date, Long auditId, String entityName,String ipAddress,String macAddress) {
		// TODO Auto-generated constructor stub
		this.action = action;
		this.detail = logDeatil;
		this.createdDate = date;
		this.entityId = auditId;
		this.entityName = entityName;
		this.ipAddress= ipAddress;
		this.macAddress= macAddress;
	}
	
	
	public Integer getAuditLogId() {
		return this.auditLogId;
	}

	public void setAuditLogId(Integer auditLogId) {
		this.auditLogId = auditLogId;
	}


	public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	
	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Timestamp getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public long getEntityId() {
		return this.entityId;
	}

	public void setEntityId(long entityId) {
		this.entityId = entityId;
	}

	public String getEntityName() {
		return this.entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	
	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getMacAddress() {
		return macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "{action" + action + ",data:" + detail +"}";
	}
	@Override
	public int compareTo(AuditLogView o) {
		return (new Long( this.getCreatedDate().getTime() - o.getCreatedDate().getTime())).intValue();
	}
}
