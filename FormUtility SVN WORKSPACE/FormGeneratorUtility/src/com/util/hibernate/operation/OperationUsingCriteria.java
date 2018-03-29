package com.util.hibernate.operation;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.exception.SQLGrammarException;

import com.util.hibernate.util.HibernateUtility;

public class OperationUsingCriteria {
	
	public <T> boolean insertData(T data){
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
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}
		catch (Exception e) {
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}

	public <T>  List<T> listData(Class<T> type){
		Session session = null;
		SessionFactory sessionFactory =  null;
		Criteria criteria = null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			criteria = session.createCriteria(type);
			List<T> dataList= criteria.list();
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
	
	//
	public <T>  int countTotalData(Class<T> type, List<Object> criterias){
	
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			
			Criteria criteria= session.createCriteria(type);
			criteria.setProjection(Projections.rowCount());
			if(criterias != null){
				for(Object criteriaData : criterias){
					if(criteriaData instanceof Criterion){
						criteria.add((Criterion)criteriaData);
					}
					//criteria.add(criteriaData);
				}
			}
			
			return new Integer(criteria.uniqueResult().toString()).intValue();
		} catch (Exception e) {
			
			e.printStackTrace();
			return 0;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}
	
	public <T>  List<T> listDataWithWhreClause(Class<T> type, List<Object> criterias){
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
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
			List<T> dataList = criteria.list();
			
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
	
	public <T>  List<T> listDataWithWhreClause(Class<T> type, List<Object> criterias,int start,int objectPerPage){
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
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
			criteria.setFirstResult(start);
			criteria.setMaxResults(objectPerPage);
			List<T> dataList = criteria.list();
			
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
	
	
	public boolean deleteData(Class<?> type, Serializable id){
		Session session = null;
		SessionFactory sessionFactory =  null;
		Transaction transaction =null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
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
			e.printStackTrace();
			return false;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}
	

	public Object getDataById(Class<?> type, Serializable id){
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
			e.printStackTrace();
			return false;
		}catch(org.hibernate.ObjectNotFoundException e){
			e.printStackTrace();
			return null;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}
	
	
	public <T> boolean updateData(T userData) {
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
			if(transaction != null){
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}finally {
			if(session != null && sessionFactory !=null){
				session.close();
				sessionFactory.close();
			}
			
		}
	}
	
	public  int updateDataWithSQL(String queryString) {
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
	
	public <T>  List<T> listDataWithSpecificField(Class<T> type, List<Object> criterias,String fieldName){
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			
			Criteria criteria= session.createCriteria(type);
			ProjectionList projections= Projections.projectionList();
			projections.add(Projections.property(fieldName));
			
			criteria.setProjection(projections);
			
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
			List<T> dataList = criteria.list();
			
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
	
	public   List listDataWithSpecificField(Class<?> type, List<Object> criterias,List<Projection> projectionList ,String fieldName){
		//System.out.println(whareClause);
		Session session = null;
		SessionFactory sessionFactory =  null;
		try {
			sessionFactory = new HibernateUtility().getSessionFactory();
			session = sessionFactory.openSession();
			
			Criteria criteria= session.createCriteria(type);
			ProjectionList projections= Projections.projectionList();
			
			for(Projection projectionData : projectionList){
				projections.add(projectionData);
			}
			
			criteria.setProjection(projections);
			
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
}
