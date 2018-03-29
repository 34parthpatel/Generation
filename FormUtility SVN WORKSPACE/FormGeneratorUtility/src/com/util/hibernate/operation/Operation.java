package com.util.hibernate.operation;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.exception.SQLGrammarException;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Repository;

import com.sttl.rest.model.JQueryDataTableParamModel;
import com.sttl.rest.model.JQueryDataTableParamModel.FormData;
import com.util.hibernate.util.HibernateUtility;

@Repository("hibernateOperation")
public class Operation {
	
	private static Logger logger = Logger.getLogger(Operation.class);
	
	public <T> boolean insertData(T data) throws Exception{
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			session.save(data);
			transaction.commit();
			return true;
		} catch(SQLGrammarException e){
			//logger.error("insertdata failed(SQLGrammarException) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("insertData failed(SQLGrammarException) : " + e);
		}
		catch (Exception e) {
			//logger.error("insertdata failed(Exception) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("insertData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("insertData() : session and sessionFactory closed");
			}
		}
	}
	public <T> boolean insertData(T data,Class<?> cls) throws Exception{
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			session.save(data);
			transaction.commit();
			return true;
		} catch(SQLGrammarException e){
			//logger.error("insertdata failed(SQLGrammarException) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("insertData failed(SQLGrammarException) : " + e);
		}
		catch (Exception e) {
			//logger.error("insertdata failed(Exception) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("insertData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("insertData() : session and sessionFactory closed");
			}
		}
	}
	public <T> Integer insertDataRestunAutoGenratedId(T data,Class<?> cls){
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			Integer i = (Integer) session.save(data);
			transaction.commit();
			return i;
		} catch(SQLGrammarException e){
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			return 0;
		}
		catch (Exception e) {
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			return 0;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}
	//
	public <T>  List<T> listData(String modelName) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			List<T> dataList= session.createQuery("from "+modelName).list();
			return dataList;
		} catch (Exception e) {
			//logger.error("listData failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("\nlistData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("listData() : session and sessionFactory closed");
			}
		}
	}
	
	public <T>  List<T> listData(String modelName,Class<?> cls) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			List<T> dataList= session.createQuery("from "+modelName).list();
			return dataList;
		} catch (Exception e) {
			//logger.error("listData failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("\nlistData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("listData() : session and sessionFactory closed");
			}
		}
	}
	
	//
	public <T>  int countTotalData(String modelName,String whareClause ) throws Exception{
		String queryWhere="";
		if(whareClause!=null || whareClause!=""){
			queryWhere = "where " + whareClause;
			System.err.println(queryWhere);
		}
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			
			Query query= session.createQuery("select count(*) from "+modelName + " "+ queryWhere );
			
			return ((Long) query.uniqueResult()).intValue();
		} catch (Exception e) {
			//logger.error("countTotalData failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("countTotalData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("countTotalData() : session and sessionFactory closed");
			}
		}
	}
	//
	public <T>  List<T> listDataWithWhreClause(String modelName,String whareClause) throws Exception{
		System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		List<T> dataList= new ArrayList<T>();
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			Query query = session.createQuery("from "+modelName + " where " + whareClause );
			
			dataList= query.list();
			
			return dataList;
		} catch (Exception e) {
			//logger.error("listDataWithWhreClause failed(Exception : )" + e);
			e.printStackTrace();
			throw new Exception("listDataWithWhreClause failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("listDataWithWhreClause() : session and sessionFactory closed");
			}
		}
		
	}
	public <T>  List<T> listDataWithWhreClause(String modelName,String whareClause,Class<?> cls) throws Exception{
		System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		List<T> dataList= new ArrayList<T>();
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			Query query = session.createQuery("from "+modelName + " where " + whareClause );
			
			dataList= query.list();
			
			return dataList;
		} catch (Exception e) {
			//logger.error("listDataWithWhreClause failed(Exception : )" + e);
			e.printStackTrace();
			throw new Exception("listDataWithWhreClause failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("listDataWithWhreClause() : session and sessionFactory closed");
			}
		}
		
	}
	public <T>  List<T> listDataWithOrderBy(String modelName,String orderIds) throws Exception{
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			Query query = session.createQuery("from "+modelName +" order by "+ orderIds);
			List<T> dataList= query.list();
			
			return dataList;
		} catch (Exception e) {
			//logger.error("listDataWithOrderBy failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("listDataWithOrderBy failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("listDataWithOrderBy() : session and sessionFactory closed");
			}
		}
	}
	//
	
	public <T>  List<T> listDataWithWhreClause(String modelName,String whareClause,int start,int noOfRecord) throws Exception{
		System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			
			Query query= session.createQuery("from "+modelName + " where " + whareClause );
			query.setFirstResult(start);
			query.setMaxResults(noOfRecord);
			return query.list();
		} catch (Exception e) {
			//logger.error("listDataWithWhreClause failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("listDataWithWhreClause failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("listDataWithWhreClause() : session and sessionFactory closed");
			}
		}
	}
	
	
	///
	
	public boolean deleteData(Class<?> type, Serializable id) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction =null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(type);
			session = sessionFactory.openSession();
			Object data= session.load(type, id);
			transaction = session.beginTransaction();
			if(data!=null){
				session.delete(data);
				transaction.commit();
				return true;
			}
			return false;
		}catch(org.hibernate.ObjectNotFoundException e){
			//logger.error("deleteData failed(ObjectNotFoundException) : " + e);
			e.printStackTrace();
			throw new Exception("deleteData failed(ObjectNotFoundException) : " + e);
		}
		catch (Exception e) {
			logger.error("deleteData failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("deleteData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("deleteData() : session and sessionFactory closed");
			}
		}
	}
	
	public Object getDataById(Class<?> type, Serializable id) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			Object data= session.get(type, id);
			if(data!=null){
			
				return data;
			}else{
				return null;
			}
		}catch(SQLGrammarException e){
			//logger.error("getDataById failed(SQLGrammarException) : " + e);
			e.printStackTrace();
			throw new Exception("getDataById failed(SQLGrammarException) : " + e);
		}catch(org.hibernate.ObjectNotFoundException e){
			//logger.error("getDataById failed(ObjectNotFoundException) : " + e);
			e.printStackTrace();
			throw new Exception("getDataById failed(ObjectNotFoundException) : " + e);
		}
		catch (Exception e) {
			//logger.error("getDataById failed(Exception) " + e);
			e.printStackTrace();
			throw new Exception("getDataById failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("getDataById() : session and sessionFactory closed");
			}
		}
	}
	
	
	public <T> boolean updateData(T userData) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			session.update(userData);
			transaction.commit();
			return true;
		} catch (Exception e) {
			//logger.error("updateData failed(Exception) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("updateData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("updateData() : session and sessionFactory closed");
			}
		}
	}
	
	
	public  int updateDataWithSQL(String queryString) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			Query query = session.createSQLQuery(queryString);
			int noOfRecordUpdated = query.executeUpdate();
			transaction.commit();
			return noOfRecordUpdated;
		} catch (Exception e) {
			//logger.error("updateDataWithSQL failed(Exception) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("updateDataWithSQL failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("updateDataWithSQL() : session and sessionFactory closed");
			}
		}
	}
	
	//Parth code
	public <T> int insertDataAndReturnId(T data) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		int id = 0;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			id = (int) session.save(data);
			transaction.commit();
			return id;
		} catch(SQLGrammarException e){
			//logger.error("insertDataAndReturnId failed(SQLGrammarException) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("insertDataAndReturnId failed(SQLGrammarException) : " + e);
		}
		catch (Exception e) {
			//logger.error("insertDataAndReturnId failed(Exception)" + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("insertDataAndReturnId failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("insertDataAndReturnId() : session and sessionFactory closed");
			}
		}
	}
	
//	return True or False
	public boolean executeSqlQuery(String query) throws Exception {
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		SQLQuery sqlQuery = null;
		int id = 0;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			sqlQuery = session.createSQLQuery(query);
			sqlQuery.executeUpdate();
			
			transaction.commit();
			return true;
		} catch(SQLGrammarException e){
			//logger.error("executeSqlQuery failed(SQLGrammarException) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("executeSqlQuery failed(SQLGrammarException) : " + e);
		}
		catch (Exception e) {
			//logger.error("executeSqlQuery failed(Exception) : " + e);
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("executeSqlQuery failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("executeSqlQuery() : session and sessionFactory closed");
			}
		}
	}
	@Transactional
	public int deleteData(String modelName,String whareClause ) throws Exception {
		String queryWhere="";
		if(whareClause!=null || whareClause!=""){
			queryWhere = "where " + whareClause;
			System.err.println(queryWhere);
		}
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			
			Query query= session.createQuery("delete from "+modelName + " "+ queryWhere );
			transaction = session.beginTransaction();
			int result = query.executeUpdate();
			transaction.commit();
			return (result);
	
		} catch (Exception e) {
			//logger.error("deleteData failed(Exception) : " + e);
			e.printStackTrace();
			throw new Exception("deleteData failed(Exception) : " + e);
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
				logger.info("deleteData() : session and sessionFactory closed");
			}
		}
	}

	// return True or False after successfully executing all queries
	public boolean batchProcessing(List<String> queries) throws Exception {
		Session session = null;
		SessionFactory sessionFactory = null;
		Transaction transaction = null;
		NativeQuery hqlQuery = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			for (String query : queries) {
				hqlQuery = session.createNativeQuery(query);
				hqlQuery.executeUpdate();
			}

			transaction.commit();
			logger.info("batchProcessing done");
			return true;
		} catch (SQLGrammarException e) {
			//logger.error("batchProcessing failed(SQLGrammarException) : " + e);
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("batchProcessing failed(SQLGrammarException) : " + e);
		} catch (Exception e) {
			//logger.error("batchProcessing failed(Exception) : " + e);
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			throw new Exception("batchProcessing failed(Exception) : " + e);
		} finally {
			if (session != null && sessionFactory != null) {
				session.close();
				sessionFactory.close();
				logger.info("batchProcessing() : session and sessionFactory closed");
			}
		}
	}
	
	/*public boolean deleteWithCriteria(Class<?> cls,String fieldName,Object value){
		Session session = null;
		SessionFactory sessionFactory = null;
		Transaction transaction = null;
		
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaDelete delete = builder.createCriteriaDelete(cls);
			
			Root root = delete.from(cls);
			//criteriaQuery.select(criteriaQuery.from(cls));
			
			delete.where(builder.equal(root.get(fieldName), value));
			
			org.hibernate.query.Query qury = session.createQuery(delete);
			qury.executeUpdate();
			return true;
		} catch (Exception e) {
			logger.error("listData failed(Exception) : " + e);
			e.printStackTrace();
			return false;
		} finally {
			if (session != null && sessionFactory != null) {
				session.close();
				sessionFactory.close();
				logger.info("listData() : session and sessionFactory closed");
			}
		}
	}*/
	
	public  List listDataWithWhereClause(Class type, List<Object> criterias){
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(type);
			session = sessionFactory.openSession();
			
			Criteria criteria= session.createCriteria(type);
			if(criterias != null){
				for(Object criteriaData : criterias){
					if(criteriaData instanceof Criterion){
						criteria.add((Criterion)criteriaData);
					}
					if(criteriaData instanceof Order){
						criteria.addOrder((Order)criteriaData);
					}
					
				}
			}
			List dataList = criteria.list();
			
			return dataList;
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}
	
	public List searchForAuditDataTable(Class<?> cls, JQueryDataTableParamModel jqDataTable, Properties prop) {
		Session session = null;
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery criteria = builder.createQuery(cls);

			Root personRoot = criteria.from(cls);
			List<javax.persistence.criteria.Predicate> listOr = new ArrayList<javax.persistence.criteria.Predicate>();
			List<javax.persistence.criteria.Predicate> listAnd = new ArrayList<javax.persistence.criteria.Predicate>();
			List<javax.persistence.criteria.Predicate> listFormDataAnd = new ArrayList<javax.persistence.criteria.Predicate>();
			List<Field> fields = new ArrayList<>(java.util.Arrays.asList(cls.getDeclaredFields()));
			Map<String, com.sttl.rest.model.JQueryDataTableParamModel.Column> columnMap;
			columnMap = jqDataTable.getColumns().stream()
					.collect(Collectors.toMap(x -> x.getData().toLowerCase(), x -> x));
			
			Map<String,FormData> formDatas = jqDataTable.getFormData().stream().collect(
											Collectors.toMap(
													x -> x.getName().toLowerCase(), 
													x->x,
													(x1, x2) ->{
														x2.setValue(x1.getValue()+"%"+x2.getValue());
														//System.out.println("" +x2.getValue());
													return  x2;
													}));
			for (Field field : fields) {

				Annotation[] annotations = field.getAnnotations();
				for (Annotation annotation : annotations) {
					jqDataTable.getSearch().setValue(jqDataTable.getSearch().getValue() == null ? "":jqDataTable.getSearch().getValue());
					if (annotation.annotationType() == javax.persistence.Column.class
							&& columnMap.containsKey(field.getName().toLowerCase())) {
						com.sttl.rest.model.JQueryDataTableParamModel.Column column = columnMap
								.get(field.getName().toLowerCase());
						
						if (field.getType() == Integer.class || field.getType() == int.class
								|| field.getType() == Float.class || field.getType() == float.class
								|| field.getType() == Double.class || field.getType() == double.class
								|| field.getType() == Long.class || field.getType() == long.class
								|| field.getType() == Short.class || field.getType() == short.class
								|| field.getType() == Byte.class || field.getType() == byte.class) {

							listOr.add(builder.like(personRoot.get(field.getName()).as(String.class),
									"%"+jqDataTable.getSearch().getValue()+"%"));
							if (!column.getSearch().getValue().equals("")) {
								listAnd.add(builder.like(personRoot.get(field.getName()).as(String.class),
										"%"+column.getSearch().getValue()+"%"));
							}
							
						} else if (field.getType() == java.sql.Date.class) {
							// lst.add(builder.like(personRoot.get("DATE_FORMAT"),keyword));
							listOr.add(builder.like(
									builder.function("" + prop.getProperty("sql-datetostring-function") + "",
											String.class, personRoot.get(field.getName()),
											builder.literal("" + prop.getProperty("sql-date-format"))),
									"%"+jqDataTable.getSearch().getValue()+"%"));
							if (!column.getSearch().getValue().equals("")) {
								listAnd.add(builder.like(
										builder.function("" + prop.getProperty("sql-datetostring-function") + "",
												String.class, personRoot.get(field.getName()),
												builder.literal("" + prop.getProperty("sql-date-format"))),
										"%"+column.getSearch().getValue()+"%"));
							}
						
						} else if (field.getType() == java.sql.Timestamp.class) {
							listOr.add(builder.like(
									builder.function("" + prop.getProperty("sql-datetostring-function") + "",
											String.class, personRoot.get(field.getName()),
											builder.literal("" + prop.getProperty("sql-datetime-format"))),
									"%"+jqDataTable.getSearch().getValue()+"%"));
							if (!column.getSearch().getValue().equals("")) {
								listAnd.add(builder.like(
										builder.function("" + prop.getProperty("sql-datetostring-function") + "",
												String.class, personRoot.get(field.getName()),
												builder.literal("" + prop.getProperty("sql-datetime-format"))),
										"%"+column.getSearch().getValue()+"%"));
							}
						} else {
							listOr.add(
									builder.like(personRoot.get(field.getName()), "%"+jqDataTable.getSearch().getValue()+"%"));
							try {
								if (!column.getSearch().getValue().equals("")) {
									System.err.println(" sys : " + "%"+column.getSearch().getValue()+"%");
									listAnd.add(builder.like(personRoot.get(field.getName()),
											"%"+column.getSearch().getValue()+"%"));
								}
							} catch (java.lang.NullPointerException e) {
								// TODO: handle exception
							}
						}
					}
				}
			}
			if(formDatas != null){
				FormData formData = formDatas.get("action");
				if (formData != null) {
					if(formData.getValue()!= null){
						listFormDataAnd.add(builder.like(personRoot.get("action"),
								"%"+formData.getValue()+"%"));
					}	
				}
				SimpleDateFormat format = new SimpleDateFormat(prop.getProperty("datetime-format"));
				formData = formDatas.get("fromdate");

				if (formData != null) {
					if (!formData.getValue().equals("")) {
						listFormDataAnd.add(builder.greaterThanOrEqualTo(personRoot.get("createdDate"),new java.sql.Timestamp(format.parse(formData.getValue()).getTime())));
					}
				}
				formData = formDatas.get("todate");

				if (formData != null) {
					if (!formData.getValue().equals("")) {
						listFormDataAnd.add(builder.lessThan(personRoot.get("createdDate"),new java.sql.Timestamp(format.parse(formData.getValue()).getTime())));
					}
				}
			}
			
			Predicate predicatesOr[] = new Predicate[listOr.size()];
			listOr.toArray(predicatesOr);
			Predicate partnerRestrictionOr = builder.or(predicatesOr);
			
			Predicate predicatesAnd[] = new Predicate[listAnd.size()];
			listAnd.toArray(predicatesAnd);
			Predicate partnerRestrictionAnd = builder.and(predicatesAnd);
			
			Predicate predicatesFormDataAnd[] = new Predicate[listFormDataAnd.size()];
			listFormDataAnd.toArray(predicatesFormDataAnd);
			Predicate partnerRestrictionFormDataAnd = builder.and(predicatesFormDataAnd);
			
			Predicate partnerRestrictionFormData = builder.and(partnerRestrictionAnd, partnerRestrictionFormDataAnd);
			Predicate partnerRestriction = builder.and(partnerRestrictionOr, partnerRestrictionFormData);
			criteria.where(partnerRestriction);
			System.out.println("count"+jqDataTable.getOrder().size());
			if (jqDataTable.getOrder().size() != 0) {
				for (com.sttl.rest.model.JQueryDataTableParamModel.Order order : jqDataTable.getOrder()) {
					if (order.getDir().equalsIgnoreCase("asc")) {
						criteria.orderBy(
								builder.asc(personRoot.get(jqDataTable.getColumns().get(order.getColumn()).getData())));
					} else {
						criteria.orderBy(builder
								.desc(personRoot.get(jqDataTable.getColumns().get(order.getColumn()).getData())));
					}
				}
			}
			//criteria.select(builder.count(personRoot));
			Query query = session.createQuery(criteria);
			query.setFirstResult(jqDataTable.getStart());
			query.setMaxResults(jqDataTable.getLength());
			
			List<Object> dataList = query.getResultList();
			//return (Long) query.getSingleResult();
			return dataList;
		} catch (Exception e) {
			logger.error("listData failed(Exception) : " + e);
			e.printStackTrace();
			return null;
		} finally {
			if (session != null && sessionFactory != null) {
				session.close();
				sessionFactory.close();
				logger.info("listData() : session and sessionFactory closed");
			}
		}

	}
	
	public long searchForAuditDataTableCount(Class<?> cls, JQueryDataTableParamModel jqDataTable, Properties prop) {
		Session session = null;
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery criteria = builder.createQuery(cls);

			Root personRoot = criteria.from(cls);
			List<javax.persistence.criteria.Predicate> listOr = new ArrayList<javax.persistence.criteria.Predicate>();
			List<javax.persistence.criteria.Predicate> listAnd = new ArrayList<javax.persistence.criteria.Predicate>();
			List<javax.persistence.criteria.Predicate> listFormDataAnd = new ArrayList<javax.persistence.criteria.Predicate>();
			List<Field> fields = new ArrayList<>(java.util.Arrays.asList(cls.getDeclaredFields()));
			Map<String, com.sttl.rest.model.JQueryDataTableParamModel.Column> columnMap;
			columnMap = jqDataTable.getColumns().stream()
					.collect(Collectors.toMap(x -> x.getData().toLowerCase(), x -> x));
			
			Map<String,FormData> formDatas = jqDataTable.getFormData().stream().collect(
											Collectors.toMap(
													x -> x.getName().toLowerCase(), 
													x->x,
													(x1, x2) ->{
														x2.setValue(x1.getValue()+"%"+x2.getValue());
														//System.out.println("" +x2.getValue());
													return  x2;
													}));
			for (Field field : fields) {

				Annotation[] annotations = field.getAnnotations();
				for (Annotation annotation : annotations) {
					jqDataTable.getSearch().setValue(jqDataTable.getSearch().getValue() == null ? "":jqDataTable.getSearch().getValue());
					if (annotation.annotationType() == javax.persistence.Column.class
							&& columnMap.containsKey(field.getName().toLowerCase())) {
						com.sttl.rest.model.JQueryDataTableParamModel.Column column = columnMap
								.get(field.getName().toLowerCase());
						
						if (field.getType() == Integer.class || field.getType() == int.class
								|| field.getType() == Float.class || field.getType() == float.class
								|| field.getType() == Double.class || field.getType() == double.class
								|| field.getType() == Long.class || field.getType() == long.class
								|| field.getType() == Short.class || field.getType() == short.class
								|| field.getType() == Byte.class || field.getType() == byte.class) {

							listOr.add(builder.like(personRoot.get(field.getName()).as(String.class),
									"%"+jqDataTable.getSearch().getValue()+"%"));
							if (!column.getSearch().getValue().equals("")) {
								listAnd.add(builder.like(personRoot.get(field.getName()).as(String.class),
										"%"+column.getSearch().getValue()+"%"));
							}
						} else if (field.getType() == java.sql.Date.class) {
							// lst.add(builder.like(personRoot.get("DATE_FORMAT"),keyword));
							listOr.add(builder.like(
									builder.function("" + prop.getProperty("sql-datetostring-function") + "",
											String.class, personRoot.get(field.getName()),
											builder.literal("" + prop.getProperty("sql-date-format"))),
									"%"+jqDataTable.getSearch().getValue()+"%"));
							if (!column.getSearch().getValue().equals("")) {
								listAnd.add(builder.like(
										builder.function("" + prop.getProperty("sql-datetostring-function") + "",
												String.class, personRoot.get(field.getName()),
												builder.literal("" + prop.getProperty("sql-date-format"))),
										"%"+column.getSearch().getValue()+"%"));
							}
						} else if (field.getType() == java.sql.Timestamp.class) {
							listOr.add(builder.like(
									builder.function("" + prop.getProperty("sql-datetostring-function") + "",
											String.class, personRoot.get(field.getName()),
											builder.literal("" + prop.getProperty("sql-datetime-format"))),
									"%"+jqDataTable.getSearch().getValue()+"%"));
							if (!column.getSearch().getValue().equals("")) {
								listAnd.add(builder.like(
										builder.function("" + prop.getProperty("sql-datetostring-function") + "",
												String.class, personRoot.get(field.getName()),
												builder.literal("" + prop.getProperty("sql-datetime-format"))),
										"%"+column.getSearch().getValue()+"%"));
							}
						} else {
							listOr.add(
									builder.like(personRoot.get(field.getName()), "%"+jqDataTable.getSearch().getValue()+"%"));
							try {
								if (!column.getSearch().getValue().equals("")) {
									System.err.println(" sys : " + "%"+column.getSearch().getValue()+"%");
									listAnd.add(builder.like(personRoot.get(field.getName()),"%"+column.getSearch().getValue()+"%"));
								}
							} catch (java.lang.NullPointerException e) {
								// TODO: handle exception
								e.printStackTrace();
							}
						}
					}
				}
			}
			if(formDatas != null){
				FormData formData = formDatas.get("action");
				if (formData != null) {
					if(formData.getValue()!= null){
						listFormDataAnd.add(builder.like(personRoot.get("action"),
								"%"+formData.getValue()+"%"));
					}	
				}
				SimpleDateFormat format = new SimpleDateFormat(prop.getProperty("datetime-format"));
				formData = formDatas.get("fromdate");

				if (formData != null) {
					if (!formData.getValue().equals("")) {
						listFormDataAnd.add(builder.greaterThanOrEqualTo(personRoot.get("createdDate"),new java.sql.Timestamp(format.parse(formData.getValue()).getTime())));
					}
				}
				formData = formDatas.get("todate");

				if (formData != null) {
					if (!formData.getValue().equals("")) {
						listFormDataAnd.add(builder.lessThan(personRoot.get("createdDate"),new java.sql.Timestamp(format.parse(formData.getValue()).getTime())));
					}
				}
			}
			
			Predicate predicatesOr[] = new Predicate[listOr.size()];
			listOr.toArray(predicatesOr);
			Predicate partnerRestrictionOr = builder.or(predicatesOr);
			
			Predicate predicatesAnd[] = new Predicate[listAnd.size()];
			listAnd.toArray(predicatesAnd);
			Predicate partnerRestrictionAnd = builder.and(predicatesAnd);
			
			Predicate predicatesFormDataAnd[] = new Predicate[listFormDataAnd.size()];
			listFormDataAnd.toArray(predicatesFormDataAnd);
			Predicate partnerRestrictionFormDataAnd = builder.and(predicatesFormDataAnd);
			
			Predicate partnerRestrictionFormData = builder.and(partnerRestrictionAnd, partnerRestrictionFormDataAnd);
			Predicate partnerRestriction = builder.and(partnerRestrictionOr, partnerRestrictionFormData);
			criteria.where(partnerRestriction);
			
			
			criteria.select(builder.count(personRoot));
			Query query = session.createQuery(criteria);
			
			//List<Object> dataList = query.getResultList();
			return (Long) query.getSingleResult();
			//return dataList;
		} catch (Exception e) {
			logger.error("listData failed(Exception) : " + e);
			e.printStackTrace();
			return 0;
		} finally {
			if (session != null && sessionFactory != null) {
				session.close();
				sessionFactory.close();
				logger.info("listData() : session and sessionFactory closed");
			}
		}

	}
	public Integer coutTotalRecord(Class cls) {
		// TODO Auto-generated method stub
		Session session = null;
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory(cls);
			session = sessionFactory.openSession();
			return Integer.parseInt(
					session.createCriteria(cls).setProjection(Projections.rowCount()).list().get(0).toString());
		} catch (Exception e) {
			logger.error("listData failed(Exception) : " + e);
			e.printStackTrace();
			return null;
		} finally {
			if (session != null && sessionFactory != null) {
				session.close();
				sessionFactory.close();
				logger.info("listData() : session and sessionFactory closed");
			}
		}
	}
}
