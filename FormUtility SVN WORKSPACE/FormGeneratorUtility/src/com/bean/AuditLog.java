package com.bean;

import java.util.Date;

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
@Table(name = "auditlog_formGeneration")
public class AuditLog implements  Comparable<AuditLog>  {
		
	private Integer auditLogId;
	private String action;
	private String detail;
	private Date createdDate;
	private long entityId;
	private String entityName;
	private  String ipAddress;
	private  String macAddress;
	public AuditLog() {
	}
	public AuditLog(String action, String logDeatil, Date date, Long auditId, String entityName,String ipAddress,String macAddress) {
		// TODO Auto-generated constructor stub
		this.action = action;
		this.detail = logDeatil;
		this.createdDate = date;
		this.entityId = auditId;
		this.entityName = entityName;
		this.ipAddress= ipAddress;
		this.macAddress= macAddress;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AUDIT_LOG_ID")
	public Integer getAuditLogId() {
		return this.auditLogId;
	}

	public void setAuditLogId(Integer auditLogId) {
		this.auditLogId = auditLogId;
	}

	@Column(name = "ACTIONS", nullable = false, length = 100)
	public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	@Column(name = "DETAIL", nullable = false, length = 65535)
	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE", nullable = false, length = 10)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "ENTITY_ID", nullable = false)
	public long getEntityId() {
		return this.entityId;
	}

	public void setEntityId(long entityId) {
		this.entityId = entityId;
	}

	@Column(name = "ENTITY_NAME", nullable = false)
	public String getEntityName() {
		return this.entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	
	@Column(name = "IP_ADDRESS", nullable = false)
	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	@Column(name = "MAC_ADDRESS", nullable = false)
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
	public int compareTo(AuditLog o) {
		return (new Long( this.getCreatedDate().getTime() - o.getCreatedDate().getTime())).intValue();
	}
}
