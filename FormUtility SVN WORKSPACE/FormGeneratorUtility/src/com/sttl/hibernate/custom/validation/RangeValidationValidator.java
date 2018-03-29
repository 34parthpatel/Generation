package com.sttl.hibernate.custom.validation;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class RangeValidationValidator implements ConstraintValidator<RangeValidation,Object> {

	//RangeValidation rangeValidation;
	String start;
	String end;
	
	@Override
	public void initialize(RangeValidation arg0) {
		// TODO Auto-generated method stub
		
		System.out.println("Intialization ");
		start =arg0.startDate();
		end =arg0.endDate();
	}

	@Override
	public boolean isValid(Object fieldData, ConstraintValidatorContext arg1) {
		// TODO Auto-generated method stub
//		String startDate="01-02-2013";
		if(fieldData instanceof java.sql.Date){
			java.sql.Date data = (java.sql.Date) fieldData;
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			try {
				java.util.Date startDate = sdf1.parse(start);
				java.util.Date endDate = sdf1.parse(end);
				java.util.Date maindate= new java.util.Date(data.getTime());
				System.out.println("Date compare" + endDate.compareTo(maindate));
				if((startDate.compareTo(maindate) ==1 ||startDate.compareTo(maindate) ==0)  && ( endDate.compareTo(maindate) == -1  || endDate.compareTo(maindate) == 0)){
					System.out.println("RangeValidation Date :"+startDate + " - " + endDate + fieldData.getClass());
					return true;
				}
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else if(fieldData instanceof java.sql.Timestamp){
			java.sql.Timestamp data = (Timestamp) fieldData;
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			try {
				java.util.Date startDate = sdf1.parse(start);
				java.util.Date endDate = sdf1.parse(end);
				java.util.Date maindate= new java.util.Date(data.getTime());
				System.out.println("dateTime compare" + endDate.compareTo(maindate));
				if((startDate.compareTo(maindate) ==1 ||startDate.compareTo(maindate) ==0)  && ( endDate.compareTo(maindate) == -1  || endDate.compareTo(maindate) == 0)){
					System.out.println("RangeValidation Datetime :"+startDate + " - " + endDate + fieldData.getClass());
					return true;
				}
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
	
		/*try {
			java.sql.Date startDate =new Date( sdf1.parse(start).getTime());
			java.sql.Date endDate =new Date( sdf1.parse(end).getTime());
			if(arg0.after(startDate) && arg0.before(endDate)){
				System.out.println("RangeValidation 2 :"+startDate + " - " + endDate + arg0.getClass());
				return true;
			}
			System.out.println("RangeValidation  1:"+startDate + " - " + endDate +" - "+ arg0);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return false;
	}
}
