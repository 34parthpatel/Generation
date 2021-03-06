package com.sttl.audit;

import java.lang.annotation.Annotation;
import java.util.Date;

import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.boot.SessionFactoryBuilder;

import com.bean.AuditLog;
import com.google.gson.Gson;

/**
 * @author bhadresh.bajariya
 *
 */
public class AuditLogUtil {
	
	public static void LogIt(String action, Object entity,  String ipAddress, String macAddress, SessionFactoryBuilder sessionFactoryBuilder)  {
		try {
			/*if(entity instanceof  IAuditLog){
				IAuditLog  audit = (IAuditLog) entity;
				AuditLog auditRecord = new AuditLog(action, audit.getLogDeatil(), new Date(), audit.getAuditId(),
						entity.getClass().getSimpleName(), ipAddress, macAddress);
				Session session = sessionFactoryBuilder.build().openSession();
				session.getTransaction().begin();
				session.save(auditRecord);
				session.getTransaction().commit();
				session.close();
				
			}else{
				AuditLog auditRecord = new AuditLog(action, entity.toString(), new Date(),new Long(entity.hashCode()),
						entity.getClass().getSimpleName(), ipAddress, macAddress);
					Session session = sessionFactoryBuilder.build().openSession();
					session.getTransaction().begin();
					session.save(auditRecord);
					session.getTransaction().commit();
					session.close();
				
			}*/
			//Gson g = new Gson();
			//g.toJson(entity);
			String tableName = null;
			Annotation annotations[] = entity.getClass().getAnnotations();
			for(Annotation annotation : annotations){
				if(annotation.annotationType() == javax.persistence.Table.class ){
					javax.persistence.Table table =(Table) annotation;
					tableName = table.name();
				}
			}
			if(tableName == null){
				tableName= entity.getClass().getSimpleName();
			}
			insertLog( action,  new Gson().toJson(entity),tableName,   ipAddress,  macAddress,  sessionFactoryBuilder);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void LogItQuery(String action, String entity,String tableName,  String ipAddress, String macAddress, SessionFactoryBuilder sessionFactoryBuilder){
		insertLog( action,  entity,tableName, ipAddress,  macAddress,  sessionFactoryBuilder);
	}
	
	private static void insertLog(String action, String json,String tableName,  String ipAddress, String macAddress, SessionFactoryBuilder sessionFactoryBuilder){
		
		AuditLog auditRecord = new AuditLog(action, json, new Date(), new Long(json.hashCode()),
				tableName, ipAddress, macAddress);
		Session session = sessionFactoryBuilder.build().openSession();
		session.getTransaction().begin();
		session.save(auditRecord);
		session.getTransaction().commit();
		session.close();
	}
}
