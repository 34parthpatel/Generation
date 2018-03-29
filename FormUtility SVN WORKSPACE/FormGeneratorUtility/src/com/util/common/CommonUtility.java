package com.util.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.tools.Diagnostic;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatch;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;

import org.apache.commons.beanutils.BeanUtils;
/*import org.hibernate.validator.ClassValidator;
import org.hibernate.validator.InvalidValue;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bean.PageMapping;
import com.bean.RegexPattern;
import com.bean.TblFormSchema;
import com.google.gson.Gson;
import com.util.hibernate.operation.Operation;


@Repository("commonUtility")
public class CommonUtility {

	@Autowired
	Operation hibernateOperation;
	
	HttpServletRequest request;
	
	public String createGetterSatter(String fieldType, String fieldName, int typeCode,String fieldSize, TblFormSchema tblFormSchema) {
		// TODO Auto-generated method stub
		String dataType = getSqlTypeName(typeCode);
		
		// fieldName = fieldName.substring(0, 1).toUpperCase() +
		// fieldName.substring(1);
		//System.out.println("hello" + tblFormSchema.getFieldController() );
		//System.out.println("hello" + tblFormSchema.getRequired());
		String dateValidation = "";
		if(tblFormSchema != null) {
			if(tblFormSchema.getRequired().equalsIgnoreCase("yes"))
			{
				//if(tblFormSchema.getFieldController().equals("date"))
				{
					dateValidation = getValidationForRequired(typeCode,fieldName,fieldSize,tblFormSchema);
					System.out.println("dateValidation " + dateValidation);
				}
			}
		}
		//dateValidation = (tblFormSchema.getFieldController().equalsIgnoreCase("date") && tblFormSchema.getRequired().equalsIgnoreCase("yes")? getValidationForDate(tblFormSchema)+"\n" : "");
		String fieldNameForMethod = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
		String getterSetter = ""+ (fieldName.equalsIgnoreCase("id") || tblFormSchema.getRequired().equalsIgnoreCase("no")?  "": getValidationFromType(typeCode,fieldName,fieldSize,tblFormSchema)+"\n")
				+ dateValidation  
				+ " @Column(name=\"" + fieldName + "\")\n"
		// + " @Getter \n" + " @Setter \n" + " "
				+" private "+ dataType + " " + fieldName + " ; \n \n" + "public " + dataType + " get" + fieldNameForMethod
				+ "() { \n" + " return " + fieldName + "; \n" + "} \n" + "public void set" + fieldNameForMethod + "("
				+ dataType + " " + fieldName + ") { \n" + "this." + fieldName + " = " + fieldName + "; \n" + "} \n";
		return getterSetter;
	}

	public String getSqlTypeName(int type) {

		switch (type) {
		case Types.BIT:
			return "boolean";
		case Types.TINYINT:
			return "boolean";
		case Types.SMALLINT:
			return "Integer";
		case Types.INTEGER:
			return "Integer";
		case Types.BIGINT:
			return "Long";
		case Types.FLOAT:
			return "Float";
		case Types.REAL:
			return "Float";
		case Types.DOUBLE:
			return "Double";
		case Types.NUMERIC:
			return "Double";
		case Types.DECIMAL:
			return "Double";
		case Types.CHAR:
			return "String";
		case Types.VARCHAR:
			return "String";
		case Types.LONGVARCHAR:
			return "String";
		case Types.DATE:
			return "java.sql.Date";
		case Types.TIME:
			return "java.sql.Time";
		case Types.TIMESTAMP:
			return "java.sql.Timestamp";
		}
		return "String";
	}

	//added by bhadresh bajariya for server side validation 
	public String getValidationFromType(int type, String fieldName,String fieldSize,TblFormSchema tblFormSchema){
		//@Pattern(regex="^[A-Za-z\\s]+$",message="Enter proper name.")
		switch (type) {
		case Types.INTEGER:
			/*return "@org.hibernate.validator.Range(max="+String.format("%1$" + fieldSize + "s", "").replace(' ', '9')+",message=\"Data must be in Proper length.\")"
				+ "@Pattern(regex=\"^[0-9]+$\",message=\"Enter proper "+fieldName+".\")";*/
			if(tblFormSchema == null){
				return "@javax.validation.constraints.NotNull(message=\""+ fieldName  +" can not be null\")"
						/*+ "@org.hibernate.validator.Range(min=1,message=\""+ fieldName +" can not be null\")"*/;
			}else{
				return "@javax.validation.constraints.NotNull(message=\""+ tblFormSchema.getFieldLabel()  +" can not be null\")"
						/*+ "@org.hibernate.validator.Range(min=1,message=\""+ tblFormSchema.getFieldLabel() +" can not be null\")"*/;
			}
			
		case Types.DOUBLE:
			return "@javax.validation.constraints.NotNull(message=\""+tblFormSchema.getFieldLabel()+" can not be null\")"
					/*+ "@org.hibernate.validator.Range(min=1,message=\""+fieldName+" can not be null\")"*/;
		case Types.FLOAT : case Types.REAL :
			return "@javax.validation.constraints.NotNull(message=\""+tblFormSchema.getFieldLabel()+" can not be null\")"
					/*+ "@org.hibernate.validator.Range(min=1,message=\""+fieldName+" can not be null\")"*/;
		case Types.NUMERIC:
			return "@javax.validation.constraints.NotNull(message=\""+tblFormSchema.getFieldLabel()+" can not be null\")"
					/*+ "@org.hibernate.validator.Range(min=1,message=\""+fieldName+" can not be null\")"*/;
		case Types.CHAR : case Types.VARCHAR : case Types.LONGVARCHAR:
			if(tblFormSchema.getFieldController().equals("checkBox")) {
				return "@javax.validation.constraints.NotNull(message=\""+tblFormSchema.getFieldLabel()+" can not be null\")"
						/*+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\""+tblFormSchema.getFieldLabel()+" Data must be in Proper length.\")\n"*/;
			}
			return "@javax.validation.constraints.NotNull(message=\""+tblFormSchema.getFieldLabel()+" can not be null\")"
					/*+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\""+tblFormSchema.getFieldLabel()+" Data must be in Proper length.\")\n"*/
					/*+ "@Pattern(regexp=\""+tblFormSchema.getRegex().replace("//","\\\\")+"\",message=\"Enter proper "+tblFormSchema.getFieldLabel()+".\")"*/;
		/*case Types.VARCHAR:
			return "@org.hibernate.validator.NotNull(message=\""+fieldName+" can not be null\")"
					+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\""+fieldName+"Data must be in Proper length.\")\n"
					+ "@Pattern(regex=\"^[A-Za-z0-9]{1}[A-Za-z0-9\\\\s,]{0,}$\",message=\"Enter proper "+fieldName+".\")";
		case Types.LONGVARCHAR:
			return "@org.hibernate.validator.NotNull(message=\""+fieldName+" can not be null\")"
					+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\"Data must be in Proper length.\")\n"
					+ "@Pattern(regex=\"^[A-Za-z0-9]{1}[A-Za-z0-9\\\\s,]{0,}$\",message=\"Enter proper "+fieldName+".\")";*/
		case Types.DATE: case Types.TIMESTAMP:
			
			String date ="@javax.validation.constraints.NotNull(message=\""+fieldName+" can not be null\")\n" ; 
			
			/*date +=  (tblFormSchema.getDatePast().equals("true") ? "@javax.validation.constraints.Past(message=\""+tblFormSchema.getFieldLabel()+" date must be in past\") \n":"");
			
			date += (tblFormSchema.getDateFuture().equals("true") ? "@javax.validation.constraints.Future(message=\""+tblFormSchema.getFieldLabel()+" date must be in future\")\n":"");
			if(tblFormSchema.getStartDate() != null){
				if(!tblFormSchema.getStartDate().isEmpty()){
					 date += "@RangeValidation(endDate=\""+tblFormSchema.getStartDate()+"\" ,startDate=\""+tblFormSchema.getEndDate()+"\", message = \""+tblFormSchema.getFieldLabel()+" must be in range (" +tblFormSchema.getStartDate() + " to "+ tblFormSchema.getEndDate() + " )\")";	
				}
			}*/
					/*+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\"Data must be in Proper length.\")\n"
					+ "@Pattern(regex=\"^[A-Za-z0-9]{1}[A-Za-z0-9\\\\s]{0,}$\",message=\"Enter proper "+fieldName+".\")";*/
			return date;
		
			/*return ""+  (tblFormSchema.getDatePast().equals("true") ? "@org.hibernate.validator.Past(message=\""+tblFormSchema.getFieldLabel()+" date must be in past\")":"")
					+(tblFormSchema.getDateFuture().equals("true") ? "@org.hibernate.validator.Future(message=\""+tblFormSchema.getFieldLabel()+" date must be in future\")":"")
					+ "@org.hibernate.validator.NotNull(message=\""+fieldName+" can not be null\")";*/
	
		default: break;
		}
		return"";
	}
	
	public String getValidationForRequired(int type, String fieldName,String fieldSize,TblFormSchema tblFormSchema){
		switch (type) {
			case Types.INTEGER:
				/*return "@org.hibernate.validator.Range(max="+String.format("%1$" + fieldSize + "s", "").replace(' ', '9')+",message=\"Data must be in Proper length.\")"
					+ "@Pattern(regex=\"^[0-9]+$\",message=\"Enter proper "+fieldName+".\")";*/
				if(tblFormSchema == null){
					return "@org.hibernate.validator.constraints.Range(min=1,message=\""+ fieldName +" can not be null\")";
				}else{
					return "@org.hibernate.validator.constraints.Range(min=1,message=\""+ tblFormSchema.getFieldLabel() +" can not be null\")";
				}
				
			case Types.DOUBLE:
				return "@org.hibernate.validator.constraints.Range(min=1,message=\""+fieldName+" can not be null\")";
			case Types.FLOAT:
				return "@org.hibernate.validator.constraints.Range(min=1,message=\""+fieldName+" can not be null\")";
			case Types.NUMERIC:
				return "@org.hibernate.validator.constraints.Range(min=1,message=\""+fieldName+" can not be null\")";
			case Types.CHAR : case Types.VARCHAR : case Types.LONGVARCHAR:
				if(tblFormSchema.getFieldController().equals("checkBox") || tblFormSchema.getFieldController().equalsIgnoreCase("radio") || tblFormSchema.getFieldController().equalsIgnoreCase("comboBox")) {
					return "@org.hibernate.validator.constraints.Length(max="+fieldSize+", message =\""+tblFormSchema.getFieldLabel()+" Data must be in Proper length.\")\n";
				}
				return "@org.hibernate.validator.constraints.Length(max="+fieldSize+", message =\""+tblFormSchema.getFieldLabel()+" Data must be in Proper length.\")\n"
						+ "@Pattern(regexp=\""+tblFormSchema.getRegex().replace("//","\\\\")+"\",message=\"Enter proper "+tblFormSchema.getFieldLabel()+".\")";
			/*case Types.VARCHAR:
				return "@org.hibernate.validator.NotNull(message=\""+fieldName+" can not be null\")"
						+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\""+fieldName+"Data must be in Proper length.\")\n"
						+ "@Pattern(regex=\"^[A-Za-z0-9]{1}[A-Za-z0-9\\\\s,]{0,}$\",message=\"Enter proper "+fieldName+".\")";
			case Types.LONGVARCHAR:
				return "@org.hibernate.validator.NotNull(message=\""+fieldName+" can not be null\")"
						+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\"Data must be in Proper length.\")\n"
						+ "@Pattern(regex=\"^[A-Za-z0-9]{1}[A-Za-z0-9\\\\s,]{0,}$\",message=\"Enter proper "+fieldName+".\")";*/
			case Types.DATE: case Types.TIMESTAMP:
				
				String date = "" ; 
				
				date +=  (tblFormSchema.getDatePast().equals("true") ? "@javax.validation.constraints.Past(message=\""+tblFormSchema.getFieldLabel()+" date must be in past\") \n":"");			
				date += (tblFormSchema.getDateFuture().equals("true") ? "@javax.validation.constraints.Future(message=\""+tblFormSchema.getFieldLabel()+" date must be in future\")\n":"");
				if(tblFormSchema.getStartDate() != null){
					if(!tblFormSchema.getStartDate().isEmpty()){
						 date += "@RangeValidation(endDate=\""+tblFormSchema.getStartDate()+"\" ,startDate=\""+tblFormSchema.getEndDate()+"\", message = \""+tblFormSchema.getFieldLabel()+" must be in range (" +tblFormSchema.getStartDate() + " to "+ tblFormSchema.getEndDate() + " )\")";	
					}
				}
						/*+ "@org.hibernate.validator.Length(max="+fieldSize+", message =\"Data must be in Proper length.\")\n"
						+ "@Pattern(regex=\"^[A-Za-z0-9]{1}[A-Za-z0-9\\\\s]{0,}$\",message=\"Enter proper "+fieldName+".\")";*/
				return date;
			
				/*return ""+  (tblFormSchema.getDatePast().equals("true") ? "@org.hibernate.validator.Past(message=\""+tblFormSchema.getFieldLabel()+" date must be in past\")":"")
						+(tblFormSchema.getDateFuture().equals("true") ? "@org.hibernate.validator.Future(message=\""+tblFormSchema.getFieldLabel()+" date must be in future\")":"")
						+ "@org.hibernate.validator.NotNull(message=\""+fieldName+" can not be null\")";*/
		
			default: break;
		}
		return"";
		
	}
	
	public boolean createFile(String fileName, String content, String extension) {
		/*
		 * File file = new File(""+fileName+"."+ extension);
		 * System.out.println("file Store Path"+file.getAbsolutePath()); try
		 * (FileOutputStream fop = new FileOutputStream(file)) {
		 * 
		 * if (!file.exists()) { file.createNewFile(); }
		 * 
		 * byte[] contentInBytes = content.getBytes();
		 * fop.write(contentInBytes); fop.flush(); fop.close();
		 * 
		 * } catch (IOException e) { e.printStackTrace(); return false; }
		 */
		System.out.println("File location : " + fileName + "." + extension);
		PrintWriter writer;
		try {
			writer = new PrintWriter(fileName + "." + extension, "UTF-8");
			writer.println(content);
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;

	}

	public String getValueFromPropertieFile(String propertyName) {
		Properties prop = new Properties();
		InputStream inputStream = null;
		inputStream = getClass().getClassLoader().getResourceAsStream("config/config.properties");
		try {
			prop.load(inputStream);
			return prop.getProperty(propertyName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "";
	}

	public Properties loadPropertieFile(String fileName) {
		Properties properties = new Properties();
		// inputStream = null;
		
		try(InputStream inputStream = getClass().getClassLoader().getResourceAsStream(fileName)) {
			properties.load(inputStream);
			/*for(Entry<Object, Object> enty : properties.entrySet()){
				System.out.println("key :" + enty.getKey() +  "  value:"+ enty.getValue());
			}*/
			return properties;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public  boolean compileJavaFile(String fileUrl) {
		DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<JavaFileObject>();
		JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
		StandardJavaFileManager fileManager = compiler.getStandardFileManager(diagnostics, null, null);
		File javaFileUri = new File(fileUrl);
		try {
			

			List<String> optionList = new ArrayList<String>();
			// set compiler's classpath to be same as the runtime's
			optionList.addAll(Arrays.asList("-classpath", System.getProperty("java.class.path")
					+ getValueFromPropertieFile("libLocation")));

			Iterable<? extends JavaFileObject> compilationUnit = fileManager
					.getJavaFileObjectsFromFiles(Arrays.asList(javaFileUri));

			JavaCompiler.CompilationTask task = compiler.getTask(null, fileManager, diagnostics, optionList, null,
					compilationUnit);

			boolean result =  task.call();
			
			if(result){
				return true;
			}else{
				System.out.println("Compilation error");
				for (Diagnostic<?> diagnostic : diagnostics.getDiagnostics()) {
		            System.err.format("Error on line %d in %s", diagnostic.getLineNumber(), diagnostic);
		        }
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}finally {
			try {
				fileManager.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean copyFile(String from, String to) {

		try {
			// Files.copy( , );
			Files.move(new File(from).toPath(), new File(to).toPath(), null);
		} catch (FileAlreadyExistsException e) {
			e.printStackTrace();
			return true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;
	}

	public Object bindDataInObject(Object bean, Class<?> cls, HttpServletRequest request, CommonsMultipartFile file, String fileName) throws Exception {

		Map<String, String[]> perametors = request.getParameterMap();
		Enumeration en = request.getParameterNames();
		System.out.print("en : " );
		//Collections.list(en).forEach(x -> System.out.print(x +" ->"));
		Field[] fields = cls.getDeclaredFields();

		/*for(Field field : fields ){
			System.out.println(field.getName());
		}*/
		
		List<PageMapping> listPageMapping = hibernateOperation.listDataWithWhreClause("PageMapping","page_name='"+cls.getSimpleName()+"'");
		//System.out.println("---" + listPageMapping.get(0).getId() + listPageMapping.get(0).getPageName());
		List<TblFormSchema> listTblFormSchema = hibernateOperation.listDataWithWhreClause("TblFormSchema","fk="+listPageMapping.get(0).getId());
		
		Map<String, TblFormSchema> map = new HashMap<String, TblFormSchema>();
		for(TblFormSchema tblFormSchema : listTblFormSchema)
		{
			map.put(tblFormSchema.getFieldName().toLowerCase(), tblFormSchema);
		}
		
		while (en.hasMoreElements()) {
			// getting the SQL column name
			String columnName = (String) en.nextElement();
			// get Table name
			System.err.println("columnName : " + columnName);
			Object columnValue = perametors.get(columnName).length > 1 ? String.join(",", perametors.get(columnName))
					: perametors.get(columnName)[0];
			for (Field field : fields) {
				System.out.println("Field name " + field.getName() + "Column name :" + columnName);
				if (field.getName().equalsIgnoreCase(columnName) && columnValue != null && (!columnValue.equals(""))) {
					try {
						if(field.getType().getSimpleName().equalsIgnoreCase("Date"))
						{
							TblFormSchema data= map.get(field.getName().toLowerCase());
							data.toString();
							System.out.println("..." + convertDateInMySqlFormat(data.getDateFormat(), columnValue.toString()));
							
							DateFormat formatter;
						    formatter = new SimpleDateFormat("yyyy-MM-dd");
						    Date date = (Date) formatter.parse(convertDateInMySqlFormat(data.getDateFormat(), columnValue.toString()));
						    /*Timestamp timeStampDate = new Timestamp(date.getTime());*/
						    BeanUtils.setProperty(bean, field.getName(), date);
						    break;
						}
						else if(field.getType().getSimpleName().equalsIgnoreCase("Timestamp"))
						{
							TblFormSchema data= map.get(field.getName().toLowerCase());
							data.toString();
							System.out.println("..." + convertDateTimeInMySqlFormat(data.getDateFormat(), columnValue.toString()));
							
							DateFormat formatter;
						    formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						    Date date = (Date) formatter.parse(convertDateTimeInMySqlFormat(data.getDateFormat(), columnValue.toString()));
						    Timestamp timeStampDate = new Timestamp(date.getTime());
						    BeanUtils.setProperty(bean, field.getName(), timeStampDate);
						    break;
						}
						
						BeanUtils.setProperty(bean, field.getName(), columnValue);
					} catch (IllegalAccessException | InvocationTargetException | ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}

			}
		
		}
		
		if(file != null) {
			BeanUtils.setProperty(bean, "file", fileName);
		}
		
		/*it is in loop
		 * if (field.getType().getSimpleName().equals("Date")) {
		 System.out.println(""+new SqlDateConverter(columnValue.equals("") ? null : columnValue)
							.convert(field.getClass(), columnValue));
		  }*/
		System.err.println(bean.toString());
		return bean;
	}

	public boolean deleteFile(String filePath) {

		File file = new File(filePath);

		return file.delete();
	}

	public Class<?> getClassTypeFromName(String modelName) {
		try {
			return Class.forName(this.getValueFromPropertieFile("beanPackage") + "." + modelName);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		return null;
	}
	public Class<?> getClassTypeFromFullName(String modelName) {
		try {
			return Class.forName( modelName);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		return null;
	}
	public String getTDTegFromControlType(String controlType, int counter) {

		String TDTeg = "";
		switch (controlType) {
		case "textbox":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox' selected>TextBox</option>"
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>"
					+ "<option value='date' >Date</option>"
					+ "<option value='number'>Number</option>"	
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "password":
				TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
						+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
						+ "<option value='textbox' >TextBox</option>"
						+ "<option value='password' selected>Password</option>"
						+ "<option value='textarea'>TextArea</option>"
						+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
						+ "<option value='comboBox'>Select</option>"
						+ "<option value='date' >Date</option>"
						+ "<option value='number'>Number</option>"
						+ "<option value='alert' >Custom Popup</option>"
						+"<option value='hyperlink' >Hyperlink</option>"
						+ "<option value='file'>File</option>"
						+ "</select></td>";
				break;
		case "textarea":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox'>TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea' selected>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date' >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			// selected
			break;
		case "checkBox":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox'>TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea' >TextArea</option>"
					+ "<option value='radio'>Radio Button</option>"
					+ "<option value='checkBox' selected >Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date' >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "radio":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox'>TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea' >TextArea</option>"
					+ "<option value='radio' selected >Radio Button</option>"
					+ "<option value='checkBox'  >Check Box</option>" + "<option value='comboBox'>Select</option>"
					+ "<option value='date' >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "comboBox":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox'>TextBox</option>"
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea' >TextArea</option>"
					+ "<option value='radio'  >Radio Button</option>" + "<option value='checkBox' >Check Box</option>"
					+ "<option value='comboBox' selected >Select</option>" 
					+ "<option value='date' >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>"
					;
			break;
		case "date":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox' >TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date' selected >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "number":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox' >TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date'  >Date</option>"
					+ "<option value='number' selected >Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "alert":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox' >TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date'  >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert' selected >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "hyperlink":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox' >TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date'  >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert'>Custom Popup</option>"
					+"<option value='hyperlink' selected>Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		case "file":
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox' >TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date'  >Date</option>"
					+ "<option value='number'>Number</option>"
					+ "<option value='alert'>Custom Popup</option>"
					+ "<option value='hyperlink'>Hyperlink</option>"
					+ "<option value='file' selected>File</option>"
					+ "</select></td>";
			break;
		default:
			TDTeg = "<td><select class='form-control temp' name='fld_ctrl' id='fld_ctrl" + counter
					+ "' onchange='getFldCtrl(\"tbl_tr" + counter + "\",\"fld_ctrl" + counter + "\")' >"
					+ "<option value='textbox'>TextBox</option>" 
					+ "<option value='password'>Password</option>"
					+ "<option value='textarea'>TextArea</option>"
					+ "<option value='radio'>Radio Button</option>" + "<option value='checkBox'>Check Box</option>"
					+ "<option value='comboBox'>Select</option>" 
					+ "<option value='date'>Date</option>"
					+ "<option value='number'  >Number</option>"
					+ "<option value='alert' >Custom Popup</option>"
					+"<option value='hyperlink' >Hyperlink</option>"
					+ "<option value='file'>File</option>"
					+ "</select></td>";
			break;
		}
		return TDTeg;
	}

	public String getTDTegFromDataType(String dataType, String controlType) {
		String TDTeg = "abc";
		System.out.println("Tag feom data type" + controlType);
		switch (dataType) {
			case "INT":
				if(controlType.equalsIgnoreCase("comboBox")  || controlType.equalsIgnoreCase("radio")){
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT' selected>INT</option>"
							+ "<option value='FLOAT' >FLOAT</option>"
							+ "<option value='CHAR'>CHAR</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "</select></td>";
				}
				else if (!controlType.equalsIgnoreCase("number")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT' selected>INT</option>"
							+ "<option value='CHAR'>CHAR</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "</select></td>";
				} else {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT' selected>INT</option>"
							+ "<option value='FLOAT' >FLOAT</option>"
							+ "<option value='DOUBLE' >DOUBLE</option>"
							+ "<option value='NUMERIC' >NUMERIC</option>"
							+ "</select></td>";
				}
	
				break;
			case "CHAR":
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='INT' >INT</option>"
						+ "<option value='CHAR' selected >CHAR</option>"
						+ "<option value='VARCHAR'>VARCHAR</option>"
						+ "</select></td>";
				if (controlType.equalsIgnoreCase("checkBox")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='CHAR' selected>CHAR</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "</select></td>";
				}
				break;
			case "VARCHAR":
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='INT' >INT</option>"
						+ "<option value='CHAR'>CHAR</option>"
						+ "<option value='VARCHAR' selected >VARCHAR</option>"
						+ "</select></td>";
				if (controlType.equalsIgnoreCase("password")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='VARCHAR' selected >VARCHAR</option>"
							+ "</select></td>";
				} else if (controlType.equalsIgnoreCase("checkBox")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='CHAR'>CHAR</option>"
							+ "<option value='VARCHAR' selected>VARCHAR</option>"
							+ "</select></td>";
				} else if(controlType.equalsIgnoreCase("comboBox") || controlType.equalsIgnoreCase("radio")){
						TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
								+ "<option value='INT'>INT</option>"
								+ "<option value='FLOAT' >FLOAT</option>"
								+ "<option value='CHAR'>CHAR</option>"
								+ "<option value='VARCHAR' selected >VARCHAR</option>"
								+ "</select></td>";
				} else if (controlType.equalsIgnoreCase("file")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='VARCHAR' selected >VARCHAR</option>"
							+ "</select></td>";
				}
				break;
			case "DATE":
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='DATE'  selected>DATE</option>"
						+ "<option value='DATETIME'>DATETIME</option>"
						+ "</select></td>";
				break;
			case "DATETIME":
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='DATE'  >DATE</option>"
						+ "<option value='DATETIME' selected>DATETIME</option>"
						+ "</select></td>";
				break;
			case "FLOAT":
				if(controlType.equalsIgnoreCase("comboBox") || controlType.equalsIgnoreCase("radio")){
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT</option>"
							+ "<option value='FLOAT' selected>FLOAT</option>"
							+ "<option value='CHAR'>CHAR</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "</select></td>";
				}
				else if (!controlType.equalsIgnoreCase("number")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "<option value='FLOAT' selected>FLOAT</option>"
							+ "<option value='DOUBLE' >DOUBLE</option>"
							+ "<option value='NUMERIC'>NUMERIC</option>"
							+ "</select></td>";
				} else {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT</option>"
							+ "<option value='FLOAT' selected>FLOAT</option>"
							+ "<option value='DOUBLE'>DOUBLE</option>"
							+ "<option value='NUMERIC'>NUMERIC</option>"
							+ "</select></td>";
				}
				break;
			case "DOUBLE":
				if (!controlType.equalsIgnoreCase("number")) {
	
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "<option value='FLOAT' >FLOAT</option>"
							+ "<option value='DOUBLE' selected>DOUBLE</option>"
							+ "<option value='NUMERIC'>NUMERIC</option>"
							+ "</select></td>";
				} else {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT</option>"
							+ "<option value='FLOAT' >FLOAT</option>"
							+ "<option value='DOUBLE' selected>DOUBLE</option>"
							+ "<option value='NUMERIC'>NUMERIC</option>"
							+ "</select></td>";
				}
				break;
			case "NUMERIC":
				if (!controlType.equalsIgnoreCase("number")) {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT-</option>"
							+ "<option value='VARCHAR'>VARCHAR</option>"
							+ "<option value='FLOAT' >FLOAT</option>"
							+ "<option value='DOUBLE'>DOUBLE</option>"
							+ "<option value='NUMERIC' selected>NUMERIC</option>"
							+ "</select></td>";
				} else {
					TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
							+ "<option value='INT'>INT</option>"
							+ "<option value='FLOAT' >FLOAT</option>"
							+ "<option value='DOUBLE' >DOUBLE</option>"
							+ "<option value='NUMERIC' selected>NUMERIC</option>"
							+ "</select></td>";
				}
				break;
			case "Custom":
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='Custom' selected>Custom</option>"
						+ "</select></td>";
				break;
			case "Link":
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='Link' selected>Link</option>"
						+ "</select></td>";
				break;
			default:
				TDTeg = "<td><select class='form-control' name='fld_type' id='fld_type'>"
						+ "<option value='INT' selected>INT</option>"
						+ "<option value='CHAR'>CHAR</option>"
						+ "<option value='VARCHAR'>VARCHAR</option>"
						+ "</select></td>";
				break;
			}
		return TDTeg;
	}
	
	public boolean checkNull(String[] strArray) {
		for (String str : strArray) {
			System.out.println(str);
			if (str.trim() == "" || str == null) {
				return true;
			}
		}
		return false;
	}
	
	public int getRegexPatternId(String fieldController)
	{
		System.out.println("fieldController :" + fieldController+"'");
		switch (fieldController.toUpperCase()) {
		case "INT":
			return 1;
		case "CHAR":
			return 0;
		case "VARCHAR":
			return 0;
		case "PASSWORD":
			return 2;
		default:
			break;
		}
		return 0;
	}
	
	public static HashMap<String, String> hibernateValidation(Class<?> type, Object object) {
		HashMap<String, String> errorList = new HashMap<>();

		try {

			/*ClassValidator classValidator = new ClassValidator(type,
					ResourceBundle.getBundle("messages", Locale.ENGLISH));
			InvalidValue[] validationMessages = classValidator.getInvalidValues(object);
			System.err.println("Length ::" + validationMessages.length);
			
				for (InvalidValue invalidValue : validationMessages) {
					// System.err.println(invalidValue.getPropertyName());
					if(invalidValue.getPropertyName().equalsIgnoreCase("id")){
						continue;
					}
					if (errorList.containsKey(invalidValue.getPropertyName())) {
						 errorList.put(invalidValue.getPropertyName(),
						 errorList.get(invalidValue.getPropertyName())+" <br>"
						 + invalidValue.getMessage());

					} else {
						errorList.put(invalidValue.getPropertyName(), invalidValue.getMessage());
						System.out.println(
								"Error key=" + invalidValue.getPropertyName() + " message= " + invalidValue.getMessage() + " Value=" + invalidValue.getValue() );
					}
					System.out.println(
							"***Error key=" + invalidValue.getPropertyName() + " message = " + invalidValue.getMessage()  + " Value=" + invalidValue.getValue() );
				}
				System.err.println("Map Length " + errorList.size());*/
			
			Validator validator;
			ValidatorFactory factory = null;
			factory = Validation.buildDefaultValidatorFactory();
			validator = factory.getValidator();
			Set<ConstraintViolation<Object>> constraintViolations =
					validator.validate( object );
			if(!constraintViolations.isEmpty()){
				for(ConstraintViolation<Object> invalidValue : constraintViolations){
					if(invalidValue.getPropertyPath().toString().equalsIgnoreCase("id")){
						continue;
					}
					if (errorList.containsKey(invalidValue.getPropertyPath().toString())) {
						 errorList.put(invalidValue.getPropertyPath().toString(), errorList.get(invalidValue.getPropertyPath().toString())+" <br>" + invalidValue.getMessage());
						 

					} else {
						errorList.put(invalidValue.getPropertyPath().toString(), invalidValue.getMessage());
					}
				}
			}else {
				if(errorList.isEmpty()){
					return null;
				 }
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : " + e);
			return null;
		}
		if(errorList.isEmpty()){
			return null;
		}
		return errorList;
	}

	public Map<String, String> createMapCollectionUsingStringArray(String[] fld_lbl, String[] fld_ctrl) {
		// TODO Auto-generated method stub
		Map<String, String> map =  new HashMap<>();
		if(fld_lbl != null && fld_ctrl != null){
			for(int i = 0 ;i< fld_lbl.length; i++ ){
				//System.out.println("fld lbl " +fld_lbl[i].toLowerCase() + "  fld_ctrl" + fld_ctrl[i] );
				map.put(fld_lbl[i].toLowerCase(),fld_ctrl[i]);
			}
			
			return map;
		}else{
			return null;	
		}
 		

	}

	public String createHTMLRegexPatternData(
			List<RegexPattern> listRegexPatterns) {
		// TODO Auto-generated method stub
		StringBuilder htmlRegexPatterns = new StringBuilder();
		htmlRegexPatterns.append("");
		for(RegexPattern regexPattern : listRegexPatterns)
		{
			htmlRegexPatterns.append("<option value=\'"+regexPattern.getPattern()+"\'>"+regexPattern.getName()+"</option>");
		}
		htmlRegexPatterns.append("");
		return htmlRegexPatterns.toString();
	}
	public String getSelectedHTMLRegexPatternData(
			List<RegexPattern> listRegexPatterns,String regex) {
		// TODO Auto-generated method stub
		StringBuilder htmlRegexPatterns = new StringBuilder();
		//htmlRegexPatterns.append("<td><select class='form-control' name='regex' id='regex'>");
		for(RegexPattern regexPattern : listRegexPatterns)
		{
			htmlRegexPatterns.append("<option value=\'"+regexPattern.getPattern()+"\'" + (regexPattern.getPattern().equals(regex)?"selected":"") +">"+regexPattern.getName()+"</option>");
		}
		//htmlRegexPatterns.append("</select></td>");
		return htmlRegexPatterns.toString();
	}

	public String getRegexPatternTitle(List<RegexPattern> regexPatterns, String regex) {
		// TODO Auto-generated method stub
		for(RegexPattern regexPattern : regexPatterns){
			if(regexPattern.getPattern().equals(regex)){
				return regexPattern.getMassage();
			}
		}
		return null;
	}

	/*public String getScriptHTMLForDateTime(String validation, String id) {
		// TODO Auto-generated method stub
		if(validation.equalsIgnoreCase("all"))
		{
			return "$('#"+id+"').datetimepicker({ " +
					"format: 'Y-m-d H:i'," +
					"});";
		}
		else if(validation.equalsIgnoreCase("past"))
		{
			return "$('#"+id+"').datetimepicker({" +
					"format: 'Y-m-d H:i'," +
					"maxDate:'+1970/01/01'," +
					"});";
		}
		else if(validation.equalsIgnoreCase("future"))
		{
			return "$('#"+id+"').datetimepicker({" +
					"format: 'Y-m-d H:i'," +
					"minDate:'-1970/01/01'," +
					"});";
		}
		
		return "";
	}*/
	
	/*public String getScriptHTMLForDate(String validation, String id) {
		// TODO Auto-generated method stub
		if(validation.equalsIgnoreCase("all"))
		{
			return "$('#"+id+"').datetimepicker({" +
					"timepicker:false," +
					"format: 'Y-m-d'," +
					"});";
		}
		else if(validation.equalsIgnoreCase("past"))
		{
			return "$('#"+id+"').datetimepicker({" +
					"timepicker:false," +
					"format: 'Y-m-d'," +
					"maxDate:'+1970/01/01'," +
					"});";
		}
		else if(validation.equalsIgnoreCase("future"))
		{
			return "$('#"+id+"').datetimepicker({" +
					"timepicker:false," +
					"format: 'Y-m-d'," +
					"minDate:'-1970/01/01'," +
					"});";
		}
		
		return "";
	}*/

	public String[] replaceInStringArray(String data[]){
		if(data == null){
			System.out.println("String array is null");
			return null;
		}
		for(int i = 0 ; i<data.length; i++){
			data[i] = data[i].replace(" ","_");
 		}
		return data;
	}

	public String convertDateTimeInDiffFormat(String targetFormatStr, String dateString) throws ParseException
	{
		DateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
		DateFormat targetFormat = null;
		if(targetFormatStr.equals("d.m.Y H:i"))
		{
			targetFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");
		}
		else if(targetFormatStr.equals("H:i d.m.Y"))
		{
			targetFormat = new SimpleDateFormat("HH:mm dd.MM.yyyy");
		}
		else if(targetFormatStr.equals("Y/m/d H:i"))
		{
			targetFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		}
		else if(targetFormatStr.equals("H:i Y/m/d"))
		{
			targetFormat = new SimpleDateFormat("HH:mm yyyy/MM/dd");
		}
		else if(targetFormatStr.equals("Y-m-d H:i"))
		{
			targetFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		}
		else if(targetFormatStr.equals("H:i Y-m-d"))
		{
			targetFormat = new SimpleDateFormat("HH:mm yyyy-MM-dd");
		}
		else
		{
			targetFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		}
		Date date;
		date = originalFormat.parse(dateString);
		return  targetFormat.format(date);
	}
	
	public String convertDateInDiffFormat(String targetFormatStr, String dateString) throws ParseException
	{
		DateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		DateFormat targetFormat = null;
		if(targetFormatStr.equals("d.m.Y H:i") || targetFormatStr.equals("H:i d.m.Y"))
		{
			targetFormat = new SimpleDateFormat("dd.MM.yyyy");
		}
		else if(targetFormatStr.equals("Y/m/d H:i") || targetFormatStr.equals("H:i Y/m/d"))
		{
			targetFormat = new SimpleDateFormat("yyyy/MM/dd");
		}
		else if(targetFormatStr.equals("Y-m-d H:i") || targetFormatStr.equals("H:i Y-m-d"))
		{
			targetFormat = new SimpleDateFormat("yyyy-MM-dd");
		}
		else
		{
			targetFormat = new SimpleDateFormat("yyyy-MM-dd");
		}
		Date date;
		date = originalFormat.parse(dateString);
		return  targetFormat.format(date);
	}
	
	public String convertDateTimeInMySqlFormat(String sourceFormatStr, String dateString) throws ParseException
	{
		System.out.println(sourceFormatStr +" : " + dateString);
		DateFormat originalFormat = null;
		if(sourceFormatStr.equals("d.m.Y H:i"))
		{
			originalFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("H:i d.m.Y"))
		{
			originalFormat = new SimpleDateFormat("HH:mm dd.MM.yyyy", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("Y/m/d H:i"))
		{
			originalFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("H:i Y/m/d"))
		{
			originalFormat = new SimpleDateFormat("HH:mm yyyy/MM/dd", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("Y-m-d H:i"))
		{
			originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("H:i Y-m-d"))
		{
			originalFormat = new SimpleDateFormat("HH:mm yyyy-MM-dd", Locale.ENGLISH);
		}
		else
		{
			originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
		}
		DateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date;
		date = originalFormat.parse(dateString);
		return  targetFormat.format(date);
	}
	
	public String convertDateInMySqlFormat(String sourceFormatStr, String dateString) throws ParseException
	{
		System.out.println(sourceFormatStr +" : " + dateString);
		DateFormat originalFormat = null;
		if(sourceFormatStr.equals("d.m.Y H:i"))
		{
			originalFormat = new SimpleDateFormat("dd.MM.yyyy", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("H:i d.m.Y"))
		{
			originalFormat = new SimpleDateFormat("dd.MM.yyyy", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("Y/m/d H:i"))
		{
			originalFormat = new SimpleDateFormat("yyyy/MM/dd", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("H:i Y/m/d"))
		{
			originalFormat = new SimpleDateFormat("yyyy/MM/dd", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("Y-m-d H:i"))
		{
			originalFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		}
		else if(sourceFormatStr.equals("H:i Y-m-d"))
		{
			originalFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		}
		else
		{
			originalFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		}
		DateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		date = originalFormat.parse(dateString);
		return  targetFormat.format(date);
	}
	
	public List<String> getJsValidationName(List<RegexPattern> listRegexPatterns, String regexPatternStr)
	{
		List<String> listStrings = new ArrayList<String>();
		for(RegexPattern regexPattern : listRegexPatterns)
		{
			if(regexPattern.getPattern().equalsIgnoreCase(regexPatternStr))
			{
				listStrings.add(regexPattern.getName().replace(" ", "_"));
				if(regexPattern.getName().equalsIgnoreCase("password"))
				{
					listStrings.add(regexPattern.getName().replace(" ", "_") + ":" + " function(a){ return (new RegExp('"+regexPatternStr.replace("//", "\\\\")+"')).test(a) },");
				}
				else
				{
					listStrings.add(regexPattern.getName().replace(" ", "_") + ":" + " function(a){ return (new RegExp('"+regexPatternStr.replace("//", "\\\\")+"')).test(a) },");
				}
				listStrings.add(regexPattern.getName().replace(" ", "_") + ":" + "{ empty: \""+regexPattern.getMassage()+"\", incorrect: \""+regexPattern.getMassage()+"\" },");
			}
		}
		
		return listStrings;
	}

	public String createHTMLRegexPatternDataForModule(List<RegexPattern> listRegexPatterns, String moduleName) {
		// TODO Auto-generated method stub
			StringBuilder htmlRegexPatterns = new StringBuilder();
			htmlRegexPatterns.append("");
			/*htmlRegexPatterns.append("<option value='Please select' selected>Please select</option>");*/
			for(RegexPattern regexPattern : listRegexPatterns)
			{
				
				if(regexPattern.getModule() !=  null && regexPattern.getModule().contains(moduleName)){
					//"+ (regexPattern.getPattern().equals("Please select")?"selected":"") +"  
						htmlRegexPatterns.append("<option value=\'"+regexPattern.getPattern()+"\' >"+regexPattern.getName()+"</option>");	
				}
			}
			htmlRegexPatterns.append("");
			return htmlRegexPatterns.toString();
	}

	public String getSelectedHTMLRegexPatternDataForModule(List<RegexPattern> listRegexPatterns, String regex,String moduleName) {
		// TODO Auto-generated method stub
		StringBuilder htmlRegexPatterns = new StringBuilder();
		//htmlRegexPatterns.append("<td><select class='form-control' name='regex' id='regex'>");
		for(RegexPattern regexPattern : listRegexPatterns)
		{
			if(regexPattern.getModule() !=  null && regexPattern.getModule().contains(moduleName))
			htmlRegexPatterns.append("<option value=\'"+regexPattern.getPattern()+"\'" + (regexPattern.getPattern().equals(regex)?"selected":"") +">"+regexPattern.getName()+"</option>");
		}
		//htmlRegexPatterns.append("</select></td>");
		return htmlRegexPatterns.toString();
	}
	
	public String getIpAndMacAddress() {
		try {

			URL url = new URL("http://192.168.6.144:8080/FormGeneratorUtility/getIpAndMacAddress");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			/*conn.setRequestProperty("Accept", "text");*/

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}

			conn.disconnect();
			return output;

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  }
		return "";
	}

	public List<String> getValidateList(TblFormSchema tblFormSchema, List<RegexPattern> listRegexPatterns) {
		List<String> listStrings = new ArrayList<String>();
		for(RegexPattern regexPattern : listRegexPatterns) {
			if(regexPattern.getPattern().equalsIgnoreCase(tblFormSchema.getRegex())) {
				if(tblFormSchema.getRequired().equalsIgnoreCase("yes")) {
					listStrings.add(tblFormSchema.getFieldName()+":{ required: true, pattern: /"+regexPattern.getPattern().replace("//", "\\")+"/ },");
				} else {
					listStrings.add(tblFormSchema.getFieldName()+":{ pattern: /"+regexPattern.getPattern().replace("//", "\\")+"/ },");
				}
				listStrings.add("df_"+tblFormSchema.getFieldName()+":{pattern: \""+regexPattern.getMassage()+"\" },");
			}
		}
		return listStrings;
	}
	
	public Map<String, String> checkFileValidation(TblFormSchema tblFormSchema, MultipartFile multiFile) throws Exception {
		//Magic magic = new Magic();
		Map<String, String> map = new HashMap<String, String>();
		MagicMatch match = null;
		/*String[] formats = { "pdf", "doc", "docx", "csv", "xls", "xlsx", "odt", "jpg", "png", "jpeg" };
		List<String> listFormats = Arrays.asList(formats);*/
		
		List<String> listFormats = this.getValidationMimeTypeFromValue(tblFormSchema.getFieldValue());
		try {
			System.err.println(multiFile.getBytes().length +" :: " + Long.parseLong(tblFormSchema.getSize())*1024);
			if(multiFile.getBytes().length <= Long.parseLong(tblFormSchema.getSize())*1024) {
				if(tblFormSchema.getRequired().equalsIgnoreCase("yes") && multiFile.getBytes().length != 0) {
					match = Magic.getMagicMatch(multiFile.getBytes());
					System.err.println("multiFile.getContentType() : " + multiFile.getContentType());
					System.err.println("MIME- " + match.getMimeType() + " : " + match.getExtension() + " : " 
							+ match.getBitmask() + " : " + match.getComparator() + " : " + match.getDescription());
					if(listFormats.contains(match.getExtension())) {
						map.put("success", "");
					} else if(multiFile.getContentType().equals("application/vnd.ms-excel") 
							|| multiFile.getContentType().equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
						if(match.getExtension().equals("doc") || match.getExtension().equals("docx")) {
							map.put("success", "");
						} else {
							map.put("error", "Please upload "+tblFormSchema.getFieldLabel()+" file of proper type");
						}
					} else {
						map.put("error", "Please upload "+tblFormSchema.getFieldLabel()+" file of proper type");
					}
				} else if(tblFormSchema.getRequired().equalsIgnoreCase("yes") && multiFile.getBytes().length == 0) {
					map.put("error", "Please select "+tblFormSchema.getFieldLabel()+" file with proper size.");
				} else if(tblFormSchema.getRequired().equalsIgnoreCase("no") && multiFile.getBytes().length != 0) {
					match = Magic.getMagicMatch(multiFile.getBytes());
					System.err.println("multiFile.getContentType() : " + multiFile.getContentType());
					System.err.println("MIME-- " + match.getMimeType() + " : " + match.getExtension() + " : " 
							+ match.getBitmask() + " : " + match.getComparator() + " : " + match.getDescription());
					if(listFormats.contains(match.getExtension())) {
						map.put("success", "");
					} else if(multiFile.getContentType().equals("application/vnd.ms-excel") 
							|| multiFile.getContentType().equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
						if(match.getExtension().equals("doc") || match.getExtension().equals("docx")) {
							map.put("success", "");
						} else {
							map.put("error", "Please upload "+tblFormSchema.getFieldLabel()+" file of proper type");
						}
					} else {
						map.put("error", "Please upload "+tblFormSchema.getFieldLabel()+" file of proper type");
					}
				} else {
					map.put("success", "");
				}
			} else {
				map.put("error", "Please select "+tblFormSchema.getFieldLabel()+" file with proper size.");
			}
		} catch (MagicMatchNotFoundException | MagicParseException | MagicException e) {
			System.err.println("MagicMatchNotFoundException exception");
			map.put("error", "Please upload "+tblFormSchema.getFieldLabel()+" file of proper type");
		}
		
		/*if(tblSchema.getRequired().equalsIgnoreCase("yes")) {
			if(file == null || file.getFileItem().getName().equals("")) {
				return false;
			}
		}*/
		return map;
	}

	public boolean isNullOrEmpty(String value) {
		// TODO Auto-generated method stub
		if(value==null)
			return true;
		else if(value.equals(""))
			return true;
		else
			return false;
	}

	public String stringJsonToHtml(String jsonString) {
		// TODO Auto-generated method stub
		try {
			Gson gson = new Gson(); 
			
			Map<String,Object> map = new HashMap<String,Object>();
			map = (Map<String,Object>) gson.fromJson(jsonString, map.getClass());
			StringBuilder htmlString = new StringBuilder();
			for(Entry<String, Object> entry  :map.entrySet()){
				if(entry.getValue() != null){
					if(entry.getValue().getClass() == String.class){
						if(!((String)entry.getValue()).equals("")){
							htmlString.append("<b>" + entry.getKey() + " :</b>");
							htmlString.append(entry.getValue() + "</br>");			
						}
					}else{
						htmlString.append("<b>" + entry.getKey() + " :</b>");
						htmlString.append(entry.getValue() + "</br>");	
					}
					
				}
				
			}
			return htmlString.toString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
		
		
	}

	private List<String> getValidationMimeTypeFromValue(String fieldValue) {
		List<String> listFormats = new ArrayList<String>();
		if(fieldValue.equals("Image")) {
			listFormats.add("jpg");
			listFormats.add("jpeg");
			listFormats.add("png");
		} else if(fieldValue.equals("Pdf")){
			listFormats.add("pdf");
		} else if(fieldValue.equals("Office")) {
			//return ".xlsx, .xls, .doc, .docx, .ppt, .pptx";
			listFormats.add("doc");
			listFormats.add("docx");
			listFormats.add("xls");
			listFormats.add("xlsx");
			listFormats.add("ppt");
			listFormats.add("pptx");
		} else {
			String fldValSplit[] = fieldValue.split(",");
			for(int j=0;j<fldValSplit.length;j++) {
				if((!fldValSplit[j].trim().equals("")) && fldValSplit[j].trim() != null ) {
					if(fldValSplit[j].trim().equalsIgnoreCase("jpg")) {
						listFormats.add("jpg");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("jpeg")) {
						listFormats.add("jpeg");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("gif")) {
						listFormats.add("gif");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("png")) {
						listFormats.add("png");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("pdf")) {
						listFormats.add("pdf");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("doc")){
						listFormats.add("doc");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("docx")) {
						listFormats.add("docx");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("xlsx")){
						listFormats.add("xlsx");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("xls")) {
						listFormats.add("xls");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("ppt")){
						listFormats.add("ppt");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("pptx")) {
						listFormats.add("pptx");
					} else if(fldValSplit[j].trim().equalsIgnoreCase("txt")){
						listFormats.add("txt");
					}
					
				}
			}
		}
		System.err.println(listFormats.toString());
		return listFormats;
	}

	public String bindDataInJson(Object bean, Class<?> cls, HttpServletRequest request, MultipartHttpServletRequest multipartRequest, String[] fileName) throws Exception {
		Map<String, String[]> perametors = request.getParameterMap();
		Enumeration en = request.getParameterNames();
		String json = "{";
		//Collections.list(en).forEach(x -> System.out.print(x +" ->"));
		Field[] fields = cls.getDeclaredFields();

		List<PageMapping> listPageMapping = hibernateOperation.listDataWithWhreClause("PageMapping","page_name='"+cls.getSimpleName()+"'");
		List<TblFormSchema> listTblFormSchema = hibernateOperation.listDataWithWhreClause("TblFormSchema","fk="+listPageMapping.get(0).getId());
		
		Map<String, TblFormSchema> map = new HashMap<String, TblFormSchema>();
		for(TblFormSchema tblFormSchema : listTblFormSchema)
		{
			map.put(tblFormSchema.getFieldName().toLowerCase(), tblFormSchema);
		}
		
		while (en.hasMoreElements()) {
			// getting the SQL column name
			String columnName = (String) en.nextElement();
			// get Table name
			System.err.println("columnName : " + columnName);
			Object columnValue = perametors.get(columnName).length > 1 ? String.join(",", perametors.get(columnName))
					: perametors.get(columnName)[0];
			for (Field field : fields) {
				System.out.println("Field name " + field.getName() + "Column name :" + columnName);
				if (field.getName().equalsIgnoreCase(columnName) && columnValue != null && (!columnValue.equals(""))) {
					try {
						if(field.getType().getSimpleName().equalsIgnoreCase("Date"))
						{
							TblFormSchema data= map.get(field.getName().toLowerCase());
							data.toString();
							System.out.println("..." + convertDateInMySqlFormat(data.getDateFormat(), columnValue.toString()));
							
							DateFormat formatter;
						    formatter = new SimpleDateFormat("yyyy-MM-dd");
						    Date date = (Date) formatter.parse(convertDateInMySqlFormat(data.getDateFormat(), columnValue.toString()));
						    /*Timestamp timeStampDate = new Timestamp(date.getTime());*/
						    //BeanUtils.setProperty(bean, field.getName(), date);
						    json += field.getName()+":"+columnValue+",";
						    break;
						}
						else if(field.getType().getSimpleName().equalsIgnoreCase("Timestamp"))
						{
							TblFormSchema data= map.get(field.getName().toLowerCase());
							data.toString();
							System.out.println("..." + convertDateTimeInMySqlFormat(data.getDateFormat(), columnValue.toString()));
							
							DateFormat formatter;
						    formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						    Date date = (Date) formatter.parse(convertDateTimeInMySqlFormat(data.getDateFormat(), columnValue.toString()));
						    Timestamp timeStampDate = new Timestamp(date.getTime());
						    //BeanUtils.setProperty(bean, field.getName(), timeStampDate);
						    json += "\""+field.getName()+"\":\""+columnValue+"\",";
						    break;
						}
						//BeanUtils.setProperty(bean, field.getName(), columnValue);
						json += "\""+field.getName()+"\":\""+columnValue+"\",";
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}
		}
		
		Iterator<String> itrator = multipartRequest.getFileNames();
		int i=0;
        while(itrator.hasNext()) {
        	MultipartFile multiFile = multipartRequest.getFile(itrator.next());
            if(multiFile != null && fileName[i] != null) {
    			BeanUtils.setProperty(bean, multiFile.getName(), fileName[i]);
    			json += "\""+multiFile.getName()+"\""+":\""+fileName[i]+"\",";
    			i++;
    		}
        }
        
		System.err.println(json.substring(0,json.lastIndexOf(",")));
		return json.substring(0,json.lastIndexOf(","))+"}";
	}

	public String getAcceptedMimeType(String fieldValue) {
		String mimetypeValue = "";
		if(fieldValue.equals("Image")) {
			return "image/*";
		} else if(fieldValue.equals("Pdf")){
			return "application/pdf";
		} else if(fieldValue.equals("Office")) {
			return "application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,"
					+ "application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,"
					+ "application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.slideshow";
		} else {
			String values[] = fieldValue.trim().split(",");
			for(String value : values) {
				if(value.trim() != "") {
					if(value.trim().equalsIgnoreCase("jpg") || value.trim().equalsIgnoreCase("jpeg")) {
						mimetypeValue += "image/jpeg,";
					} else if(value.trim().equalsIgnoreCase("gif")) {
						mimetypeValue += "image/gif,";
					} else if(value.trim().equalsIgnoreCase("png")) {
						mimetypeValue += "image/png,";
					} else if(value.trim().equalsIgnoreCase("pdf")) {
						mimetypeValue += "application/pdf,";
					} else if(value.trim().equalsIgnoreCase("doc")) {
						mimetypeValue += "application/msword,";
					} else if(value.trim().equalsIgnoreCase("docx")) {
						mimetypeValue += "application/vnd.openxmlformats-officedocument.wordprocessingml.document,";
					} else if(value.trim().equalsIgnoreCase("xlsx")) {
						mimetypeValue += "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,";
					} else if(value.trim().equalsIgnoreCase("xls")) {
						mimetypeValue += "application/vnd.ms-excel,";
					} else if(value.trim().equalsIgnoreCase("ppt")) {
						mimetypeValue += "application/vnd.ms-powerpoint,";
					} else if(value.trim().equalsIgnoreCase("pptx")) {
						mimetypeValue += "application/vnd.openxmlformats-officedocument.presentationml.slideshow,";
					} else if(value.trim().equalsIgnoreCase("txt")) {
						mimetypeValue += "text/plain,";
					}
				}
			}
			mimetypeValue = mimetypeValue.substring(0,mimetypeValue.length()-1);
		}
		return mimetypeValue;
	}
}
