package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.apache.log4j.PropertyConfigurator;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.FileUpload;
import com.bean.PageMapping;
import com.bean.RegexPattern;
import com.bean.TblFormSchema;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.service.FormUtilityService;
import com.sttl.crypto.CryptoUtils;
import com.sttl.rest.operation.RestOperation;
import com.util.common.CommonUtility;

@Controller
public class FormUtilityController implements Filter {

	@Autowired
	private FormUtilityService formUtilityService;

	@Autowired
	private CommonUtility commonUtility;

	private Logger logger = Logger.getLogger(FormUtilityController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpSession session) {
		try {
			logger.info("FormUtilityController.home() start");
			System.out.println(session + " : " + session.getId());
			System.out.println("Before log4j configuration");
			String webAppPath = request.getServletContext().getRealPath("/");
			String log4jFilePath = webAppPath + "WEB-INF\\classes\\log4j.properties";
			// MDC.put("sessionId", session.getId());
			PropertyConfigurator.configure(log4jFilePath);
			logger.info("configuration log4j.properties done");
			System.out.println("After log4j configuration");
			// System.out.println("in home"); //print three times ,when first
			// called.
			logger.info("FormUtilityController.home() end");
		} catch (Exception e) {
			logger.error("home failed : " + e, e);
		}
		return new ModelAndView("redirect:index");
	}

	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public ModelAndView updateForm(ModelMap model, HttpServletRequest request, RedirectAttributes redirect) {
		logger.info("FormUtilityController.updateForm() start");
		String pageMappingId = request.getParameter("pageMappingId");
		logger.info("getting pageMappingId : " + pageMappingId);
		List<TblFormSchema> listFormSchemas = null;
		List<RegexPattern> listRegexPatterns = null;
		String formTableString = null;
		PageMapping pageMappingObj = null;
		try {
			pageMappingObj = formUtilityService.getPageMappingData(pageMappingId);
			logger.info("pageMappingObj : " + pageMappingObj);
			listFormSchemas = formUtilityService.getTableFormSchemaData(pageMappingObj.getId());
			logger.info("pageMappingObj : " + listFormSchemas);
			// System.out.println("Count " + listFormSchemas.size());
			listRegexPatterns = formUtilityService.getListRegEx(null);
			logger.info("listRegexPatterns : " + listRegexPatterns);
			formTableString = formUtilityService.generateHTMLFormTableString(listFormSchemas, listRegexPatterns);
			logger.info("formTableString : " + formTableString);

			String htmlRegexPatternsForTextModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "TextModule");
			String htmlRegexPatternsForSelectModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "SelectModule");
			String htmlRegexPatternsForNumberModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "NumberModule");
			String htmlRegexPatternsForPasswordModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "PasswordModule");
			String htmlRegexPatternsForRadioModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "RadioModule");
			String htmlRegexPatternsForCheckboxModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "CheckboxModule");
			String htmlRegexPatternsForDateModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "DateModule");

			ModelAndView modelAndView = new ModelAndView("updateForm");
			modelAndView.addObject("htmlRegexPatternsForTextModule", htmlRegexPatternsForTextModule);
			modelAndView.addObject("htmlRegexPatternsForSelectModule", htmlRegexPatternsForSelectModule);
			modelAndView.addObject("htmlRegexPatternsForNumberModule", htmlRegexPatternsForNumberModule);
			modelAndView.addObject("htmlRegexPatternsForPasswordModule", htmlRegexPatternsForPasswordModule);
			modelAndView.addObject("htmlRegexPatternsForRadioModule", htmlRegexPatternsForRadioModule);
			modelAndView.addObject("htmlRegexPatternsForCheckboxModule", htmlRegexPatternsForCheckboxModule);
			modelAndView.addObject("htmlRegexPatternsForDateModule", htmlRegexPatternsForDateModule);
			logger.info("validation module set");

			// formUtilityService.genrateClass();
			modelAndView.addObject("pageID", pageMappingId);
			modelAndView.addObject("counter", listFormSchemas.size() + 1);
			modelAndView.addObject("htmlFormTable", formTableString);
			modelAndView.addObject("pageName", pageMappingObj.getPageName());
			modelAndView.addObject("contextHelp", pageMappingObj.getFromContextHelp());
			logger.info("objects set in updateForm");
			logger.info("FormUtilityController.updateForm() end");
			return modelAndView;
		} catch (NullPointerException e) {
			logger.error("updateForm failed(NullPointerException) : " + e, e);
			ModelAndView modelAndView = new ModelAndView("redirect:index");
			redirect.addFlashAttribute("errMsg", "You could not update this page.");
			return modelAndView;
		} catch (Exception e) {
			logger.error("updateForm failed(Exception) : " + e, e);
			ModelAndView modelAndView = new ModelAndView("redirect:index");
			redirect.addFlashAttribute("errMsg", "You could not update this page.");
			return modelAndView;
		}
	}

	/*
	 * @RequestMapping(value="/genrateClassFromTable" ,method =
	 * RequestMethod.POST) public String generateClassFromTable(ModelMap
	 * model,HttpServletRequest request) { model.addAttribute("message",
	 * "Hello Spring MVC Framework!"); String buildPath
	 * =request.getServletContext().getRealPath("/");
	 * System.out.println("build path: " + buildPath);
	 * if(formUtilityService.generateClassFromTable("tbl_form_schema",buildPath,
	 * null)){
	 * 
	 * }else{
	 * 
	 * } // System.out.println( request.getServletContext().getRealPath("/"));
	 * return "GenrateClass"; }
	 */

	@RequestMapping(value = "/insertForm/{path}", method = RequestMethod.POST)
	public String insertForm(@PathVariable("path") String path, HttpServletRequest request, ModelMap model,
			RedirectAttributes redirectAttrs, @RequestParam(required = false) CommonsMultipartFile file)
			throws Exception {
		logger.info("FormUtilityController.insertForm() start");
		String remainingPaths = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		String fileName = null;
		
		boolean flag = false;
		
		if (file != null && !file.getFileItem().getName().equals("")) {
			DateFormat dateFormat = new SimpleDateFormat("MMddyyyyHHmmssS");
			fileName = dateFormat.format(new Date())+"_"+path+".txt";
		}
		
		Class<?> clazz;
		try {
			clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			Object clsObject = clazz.newInstance();
			logger.info("class object created");
			System.out.println("" + clsObject.getClass());
			Object dataObject = commonUtility.bindDataInObject(clsObject, clsObject.getClass(), request, file, fileName);
			logger.info("binding data in object done");
			System.out.println(dataObject);
			HashMap<String, String> validateMessages = commonUtility.hibernateValidation(clsObject.getClass(),
					dataObject);
			Integer id = new Integer(0);
			if (validateMessages == null) {
				/*Map<String, String> map = formUtilityService.checkFileValidation(path, file);*/
				Map<String, String> map = new HashMap<String, String>();
				if(map != null) {
					if (map.containsKey("success")) {
						if ((id = formUtilityService.insertDataRestunAutoGenratedId(dataObject, clsObject.getClass())) != 0) {
							
							FileUpload fileUpload = new FileUpload();
							//fileUpload.setTableId(id.intValue());
							//fileUpload.setTableName(path);
							//fileUpload.setFileName(file.getOriginalFilename());
							//System.out.println(file.getFileItem().getName());
							fileUpload.setExtension(file.getFileItem().getName().substring(file.getFileItem().getName().lastIndexOf(".")));
							fileUpload.setFileName(fileName);
							formUtilityService.uploadFile(fileUpload, file);
							System.out.println("Current Path : " + request.getServletContext().getRealPath("/"));
							
							redirectAttrs.addFlashAttribute("message", "Data inserted successfully!");
							logger.info("data inserted successfully");
						}else {
							redirectAttrs.addFlashAttribute("errMessage", "Data insertion fail");
							logger.info("Data insertion fail");
						}
					} else if(map.containsKey("nofile")){
						formUtilityService.insertData(dataObject, clsObject.getClass());
						redirectAttrs.addFlashAttribute("message", "Data inserted successfully!");
						logger.info("data inserted successfully");
					} else {
						redirectAttrs.addFlashAttribute("errMessage", map.get("error"));
						return "redirect:../openForm/" + path;
					}
				}
			} else {
				System.out.println(validateMessages);
				StringBuilder errorMessage = new StringBuilder();
				for (Map.Entry<String, String> validationMsg : validateMessages.entrySet()) {
					errorMessage.append(validationMsg.getValue() + "<br>");
				}
				logger.info("error messages : " + errorMessage.toString());
				redirectAttrs.addFlashAttribute("errMessage", errorMessage.toString());
			}
				
		} catch (ClassNotFoundException e) {
			logger.error("insertForm failed(ClassNotFoundException) : " + e, e);
			e.printStackTrace();
		} catch (InstantiationException e) {
			logger.info("insertForm failed(InstantiationException) : " + e, e);
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			logger.info("insertForm failed(IllegalAccessException) : " + e, e);
			e.printStackTrace();
		}
		// ModelAndView modelAndView = new ModelAndView("redirect:openForm/"+path);
		logger.info("FormUtilityController.insertForm() end");
		return "redirect:../openForm/" + path;
	}

	@RequestMapping(value = "/openForm/{path}", method = RequestMethod.GET)
	public String openForm(@PathVariable("path") String path, HttpServletRequest request, ModelMap model)
			throws Exception {
		logger.info("FormUtilityController.openForm() start");
		String remainingPaths = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		System.out.println("path = " + path + "/" + remainingPaths);
		String buildPath = request.getServletContext().getRealPath("/");
		try {
			/*
			 * String pageName = (String) model.get("pageName"); String
			 * compileLocation = request.getServletContext().getRealPath("/");
			 */
			List list = formUtilityService
					.getListDataFromModelName(path.substring(0, 1).toUpperCase() + path.substring(1));
			System.out.println("datalist" + list);
			if (list != null) {
				logger.info("getting data for the Form : " + list.toString());
			} else {
				logger.info("getting data for the Form : " + list);
			}

			// model.addAttribute("message", "Form Generated Successfully!");
			model.addAttribute("listData", list);
			// return path;
		} catch (Exception e) {
			logger.error("\nopenForm failed(Exception) : " + e, e);
			request.setAttribute("errMsg", "" + path + ",this form have some problem try after sometime.");
			return "index";
		}

		logger.info("FormUtilityController.openForm() end");
		return path;
	}

	// Parth Code.

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errorPage(ModelMap model) {
		logger.info("FormUtilityController.errorPage() start");
		model.addAttribute("message", "!");
		logger.info("FormUtilityController.errorPage() end");
		return "error";
	}

	@RequestMapping(value = "/generateTable", method = RequestMethod.POST)
	public ModelAndView generateTable(RedirectAttributes redirect, HttpServletRequest request) throws Exception {
		logger.info("FormUtilityController.generateTable() start");
		String[] fld_ctrl = request.getParameterValues("fld_ctrl");
		String[] fld_type = request.getParameterValues("fld_type");
		String[] fld_lbl = request.getParameterValues("fld_lbl");
		String[] fld_name = request.getParameterValues("fld_name");
		String[] fld_size = request.getParameterValues("fld_size");
		String[] fld_val = request.getParameterValues("fld_val");
		String[] fld_index = request.getParameterValues("fld_index");
		String[] regex = request.getParameterValues("regex");
		String[] tooltip = request.getParameterValues("tooltip");
		String[] start_date = request.getParameterValues("start_date");
		String[] end_date = request.getParameterValues("end_date");
		String[] date_format = request.getParameterValues("date_format");
		String[] date_all = request.getParameterValues("date_all");
		String[] date_past = request.getParameterValues("date_past");
		String[] date_future = request.getParameterValues("date_future");
		String[] required = request.getParameterValues("required");
		String fromContextHelp = request.getParameter("fromContextHelp");

		for (int j = 0; j < fld_ctrl.length; j++) {
			System.out.print(fld_ctrl[j] + " : " + fld_type[j] + " : " + fld_name[j] + " : " + fld_val[j] + " : "
					+ regex[j] + " : " + required[j] + " : ");
			System.out.print(start_date[j] + " : " + end_date[j] + " : " + date_format[j]);
			System.out.println(date_all[j] + " : " + date_past[j] + " : " + date_future[j]);
		}

		String pageName = request.getParameter("pageName").trim();

		Set<String> setFieldName = new HashSet<>();
		for( String fldName :fld_name){
			if(setFieldName.contains(fldName.toLowerCase())) {
				System.err.println("Set value = " + fldName);
				ModelAndView modelAndView = new ModelAndView("redirect:index");
				redirect.addFlashAttribute("errMsg", "\""+ fldName + "\" field exist more than one time");
				logger.error(fldName + " exist more than one time");
				return modelAndView;
			}else{
				setFieldName.add(fldName.toLowerCase());
			}
		}
		
		// fld_name=commonUtility.replaceInStringArray(fld_name);
		/*
		 * Map<String, String> controlMapWithName =
		 * commonUtility.createMapCollectionUsingStringArray(fld_name,fld_ctrl);
		 * 
		 * Map<String, String> regexMapWithName =
		 * commonUtility.createMapCollectionUsingStringArray(fld_name,regex);
		 */
		// List<RegexPattern> listRegEx= formUtilityService.getListRegEx(regex);
		// System.out.println("List regex" + listRegEx);
		
		System.out.println("Field " + Arrays.toString(fld_name).replace('[', ',').replace(']', ','));
		if (Arrays.toString(fld_name).replace("[", ", ").replace(']', ',').toLowerCase().contains(", id,")) {
			ModelAndView modelAndView = new ModelAndView("redirect:index");
			redirect.addFlashAttribute("errMsg", "Id field Can not be inserted,Its By default!");
			logger.error("Id field Can not be inserted,Its By default!");
			return modelAndView;
		}
		String compileLocation = request.getServletContext().getRealPath("/");
		int pageMappingId = 0;
		try {

			if (pageName.equals("") || commonUtility.checkNull(fld_ctrl) || commonUtility.checkNull(fld_type)
					|| commonUtility.checkNull(fld_lbl) || commonUtility.checkNull(fld_name)
					|| commonUtility.checkNull(fld_index)) {
				ModelAndView modelAndView = new ModelAndView("redirect:index");
				redirect.addFlashAttribute("errMsg", "Please insert proper data!");
				logger.error("Please insert proper data!");
				return modelAndView;
			}

			if (pageName != "" && pageName != null) {
				if (formUtilityService.isPageExist(pageName)) {
					ModelAndView modelAndView = new ModelAndView("redirect:index");
					redirect.addFlashAttribute("errMsg", "Page already exist!");
					logger.error("Page already exist!");
					return modelAndView;
				}
			}

			PageMapping pageMapping = new PageMapping();
			pageMapping.setPageName(pageName);
			pageMapping.setFromContextHelp(fromContextHelp);

			Map<String, TblFormSchema> tableFormSchemaMapList = formUtilityService.setTableFormSchemaInMap(fld_ctrl,
					fld_type, fld_lbl, fld_name, fld_size, fld_val, fld_index, regex, tooltip, date_all, date_past,
					date_future, start_date, end_date, date_format, required, 0);
			System.err.println("map : " + tableFormSchemaMapList.toString());
			logger.info("form data setted in Map");
			HashMap<String, String> errorFields = formUtilityService.validateFormGenerationData(pageMapping,
					tableFormSchemaMapList);
			// System.out.println("List" + list + " total map value is
			// "+tableFormSchemaMap.values().size());
			if (errorFields.isEmpty()) {
				pageMappingId = formUtilityService.insertPageMappingData(pageMapping);
				System.out.println("pageMappingId : " + pageMappingId);
				if (formUtilityService.insertFieldData(tableFormSchemaMapList, pageMappingId)) {
					logger.info("formUtilityService.insertFieldData() done");
					if (formUtilityService.createTable(pageName, tableFormSchemaMapList)) {
						logger.info("formUtilityService.createTable() done");
						// Bhadresh Bajariya
						String buildPath = request.getServletContext().getRealPath("/");

						if (formUtilityService.generateClassFromTable(pageName, buildPath, tableFormSchemaMapList)) {
							logger.info("formUtilityService.generateClassFromTable() done");
							List<TblFormSchema> list = formUtilityService.getTableFormSchemaData(pageMappingId);
							formUtilityService.generateForm(list, pageMapping, compileLocation);
							logger.info("formUtilityService.generateForm() done");
						} else {
							if (formUtilityService.dropForm(pageMappingId, pageName, compileLocation)) {
								System.out.println("All form data deleted Due to get Exception of class genration");
								logger.error("All form data deleted Due to get Exception of class genration");
							}
							logger.error("ClassGenration failed");
							ModelAndView modelAndView = new ModelAndView("redirect:index");
							redirect.addFlashAttribute("errMsg", "ClassGenration failed");
							return modelAndView;
						}

					} else {
						if (formUtilityService.deletePageMappingFromPageName(pageName)) {
							logger.error("Page Mapping deleted");
						}
						if (formUtilityService.deletePageTableFields(pageMappingId) != 0) {
							logger.info("Page Mapping Field deleted");
						}
						logger.error("Table Creation failed");
						ModelAndView modelAndView = new ModelAndView("redirect:index");
						redirect.addFlashAttribute("errMsg", "Table Creation failed");
						return modelAndView;
					}
				} else {
					if (formUtilityService.deletePageMappingFromPageName(pageName)) {
						System.out.println("Page Mapping deleted");
						logger.error("Page Mapping deleted");
					}
					logger.error("Failed insertion faild, delete page and retry");
					ModelAndView modelAndView = new ModelAndView("redirect:index");
					redirect.addFlashAttribute("errMsg", "Failed insertion faild, delete page and retry");
					return modelAndView;
				}
			} else {
				String errorString = "";
				for (Entry<String, String> error : errorFields.entrySet()) {
					// errorList.putAll(
					// commonUtility.hibernateValidation(TblFormSchema.class,
					// tblFormSchema.getValue()));
					// System.out.println("Error : "+ error.getValue());
					errorString += error.getValue() + "<br>";
				}
				ModelAndView modelAndView = new ModelAndView("redirect:index");
				redirect.addFlashAttribute("errMsg", errorString);
				logger.error("error messages : " + errorString);
				return modelAndView;
			}

			// End Code

			ModelAndView modelAndView = new ModelAndView("redirect:openForm/" + pageName);
			redirect.addFlashAttribute("pageName", pageName);
			logger.info("FormUtilityController.generateTable() end");
			return modelAndView;
		} catch (Exception e) {
			logger.error("generateTable failed(Exception) : " + e, e);
			if (formUtilityService.dropForm(pageMappingId, pageName, compileLocation)) {
				System.out.println("All form data deleted Due to get Exception : " + e.getMessage());
			}
			e.printStackTrace();
			return new ModelAndView("error").addObject("errMsg", "Please insert proper data!");
		}

	}

	@RequestMapping(value = "/updateTable", method = RequestMethod.POST)
	public ModelAndView updateTable(RedirectAttributes redirect, HttpServletRequest request) {
		logger.info("FormUtilityController.updateTable() start");
		String[] fld_ctrl = request.getParameterValues("fld_ctrl");
		String[] fld_type = request.getParameterValues("fld_type");
		String[] fld_lbl = request.getParameterValues("fld_lbl");
		String[] fld_name = request.getParameterValues("fld_name");
		String[] fld_size = request.getParameterValues("fld_size");
		String[] fld_val = request.getParameterValues("fld_val");
		String[] fld_index = request.getParameterValues("fld_index");
		String[] regex = request.getParameterValues("regex");
		String[] tooltip = request.getParameterValues("tooltip");
		String[] start_date = request.getParameterValues("start_date");
		String[] end_date = request.getParameterValues("end_date");
		String[] date_format = request.getParameterValues("date_format");
		String[] date_all = request.getParameterValues("date_all");
		String[] date_past = request.getParameterValues("date_past");
		String[] date_future = request.getParameterValues("date_future");
		String[] required = request.getParameterValues("required");
		String fromContextHelp = request.getParameter("fromContextHelp");

		System.out.println("Field " + Arrays.toString(fld_name).replace('[', ',').replace(']', ','));
		// fld_name=commonUtility.replaceInStringArray(fld_name);
		String pageName = request.getParameter("pageName");
		int pageId = Integer.parseInt(request.getParameter("tableId"));

		try {
			List<TblFormSchema> listCurrentTblFormSchemaData = formUtilityService.getTableFormSchemaData(pageId);

			if (Arrays.toString(fld_name).replace("[", ", ").replace(']', ',').toLowerCase().contains(", id,")) {
				logger.error("Id field Can not be inserted,Its By default!");
				ModelAndView modelAndView = new ModelAndView("redirect:index");
				redirect.addFlashAttribute("errMsg", "Id field Can not be inserted,Its By default!");
				return modelAndView;
			}

			if (pageName.equals("") || commonUtility.checkNull(fld_ctrl) || commonUtility.checkNull(fld_type)
					|| commonUtility.checkNull(fld_lbl) || commonUtility.checkNull(fld_name)
					|| commonUtility.checkNull(fld_index)) {
				logger.error("Please insert proper data!");
				ModelAndView modelAndView = new ModelAndView("redirect:index");
				redirect.addFlashAttribute("errMsg", "Please insert proper data!");
				return modelAndView;
			}

			PageMapping pageMapping = new PageMapping();
			pageMapping = formUtilityService.getPageMappingData(request.getParameter("tableId"));
			pageMapping.setFromContextHelp(fromContextHelp);

			String buildPath = request.getServletContext().getRealPath("/");
			Map<String, TblFormSchema> tableFormSchemaMapList = formUtilityService.setTableFormSchemaInMap(fld_ctrl,
					fld_type, fld_lbl, fld_name, fld_size, fld_val, fld_index, regex, tooltip, date_all, date_past,
					date_future, start_date, end_date, date_format, required, pageId);
			logger.info("form data setted in Map");

			HashMap<String, String> errorFields = formUtilityService.validateFormGenerationData(pageMapping,
					tableFormSchemaMapList);

			// Insert field in Table

			if (errorFields.isEmpty()) {
				// Delete old field from Table
				if (!formUtilityService.updateObject(pageMapping)) {
					logger.error("Table Mapping Updation failed");
					ModelAndView modelAndView = new ModelAndView("redirect:index");
					redirect.addFlashAttribute("errMsg", "Table Mapping Updation failed");
					return modelAndView;
				}

				formUtilityService.deletePageTableFields(pageId);
				logger.info("delete old data done");
				/*
				 * Map<String, TblFormSchema> tableFormSchemaMap=
				 * formUtilityService.insertFieldData(fld_ctrl,fld_type,
				 * fld_lbl, fld_name, fld_size, fld_val, fld_index, regex,
				 * date_all, date_past, date_future, start_date, end_date,
				 * date_format, pageId);
				 */

				if (formUtilityService.insertFieldData(tableFormSchemaMapList, pageId)) {
					logger.info("formUtilityService.insertFieldData() done");
					if (formUtilityService.updateTableSchema(pageName, tableFormSchemaMapList)) {
						logger.info("formUtilityService.updateTableSchema() done");
						// Bhadresh Bajariya

						if (formUtilityService.generateClassFromTable(pageName, buildPath, tableFormSchemaMapList)) {
							logger.info("formUtilityService.generateClassFromTable() done");
							// Recreate form
							String compileLocation = request.getServletContext().getRealPath("/");
							List<TblFormSchema> list = formUtilityService.getTableFormSchemaData(pageId);
							formUtilityService.generateForm(list, pageMapping, compileLocation);
							logger.info("formUtilityService.generateForm() done");
							System.out.println("Form Genration is done ");
							// update table schema
						} else {
							if (!formUtilityService.regenerateTableAndForm(pageId, pageName,
									listCurrentTblFormSchemaData, buildPath)) {
								formUtilityService.dropForm(pageId, pageName, buildPath);
								logger.error("drop form done");
								logger.error("Table and Form distroy due to Technical problem");
								ModelAndView modelAndView = new ModelAndView("redirect:index");
								redirect.addFlashAttribute("errMsg", "Table and Form distroy due to Technical problem");
								return modelAndView;
							}
							logger.error(
									"System rollback your data due to ClassGenration failed, and All table data distroy");
							ModelAndView modelAndView = new ModelAndView("redirect:index");
							redirect.addFlashAttribute("errMsg",
									"System rollback your data due to ClassGenration failed, and All table data distroy");
							return modelAndView;
						}

					} else {
						logger.error("drop form done");
						if (!formUtilityService.regenerateTableAndForm(pageId, pageName, listCurrentTblFormSchemaData,
								buildPath)) {
							logger.error("Table and Form distroy due to Technical problem");
							formUtilityService.dropForm(pageId, pageName, buildPath);
							ModelAndView modelAndView = new ModelAndView("redirect:index");
							redirect.addFlashAttribute("errMsg", "Table and Form distroy due to Technical problem");
							return modelAndView;
						}
						logger.error(
								"System rollback your data due to Table Updating failed, and All table data distroy");
						ModelAndView modelAndView = new ModelAndView("redirect:index");
						redirect.addFlashAttribute("errMsg",
								"System rollback your data due to Table Updating failed, and All table data distroy");
						return modelAndView;
					}
				} else {
					if (!formUtilityService.regenerateTableAndForm(pageId, pageName, listCurrentTblFormSchemaData,
							buildPath)) {
						formUtilityService.dropForm(pageId, pageName, buildPath);
						ModelAndView modelAndView = new ModelAndView("redirect:index");
						redirect.addFlashAttribute("errMsg", "Table and Form distroy due to Technical problem");
						return modelAndView;
					}
					logger.error("System rollback your data due to Failed Update, and All table data distroy");
					ModelAndView modelAndView = new ModelAndView("redirect:index");
					redirect.addFlashAttribute("errMsg",
							"System rollback your data due to Failed Update, and All table data distroy");
					return modelAndView;
				}

			} else {
				String errorString = "";
				for (Entry<String, String> error : errorFields.entrySet()) {
					// errorList.putAll(
					// commonUtility.hibernateValidation(TblFormSchema.class,
					// tblFormSchema.getValue()));
					// System.out.println("Error : "+ error.getValue());
					errorString += error.getValue() + "<br>";
				}
				logger.error("error messages : " + errorString);
				ModelAndView modelAndView = new ModelAndView("redirect:index");
				redirect.addFlashAttribute("errMsg", errorString);
				return modelAndView;
			}

			System.out.println("Class Genration is done ");
			// End Code

			ModelAndView modelAndView = new ModelAndView("redirect:index");
			/*
			 * redirect.addFlashAttribute("fk", pageId);
			 * redirect.addFlashAttribute("pageName", pageName);
			 */
			logger.info("FormUtilityController.updateTable() end");
			return modelAndView;
		} catch (Exception e) {
			logger.error("updateTable failed(Exception) : " + e, e);
			ModelAndView modelAndView = new ModelAndView("redirect:index");
			redirect.addFlashAttribute("errMsg", "Failed Update, and All table data distroy");
			return modelAndView;
		}

	}

	@RequestMapping(value = "/dropForm", method = RequestMethod.POST)
	public ModelAndView dropForm(ModelMap model, HttpServletRequest request) {
		try {
			logger.info("FormUtilityController.dropForm() start");
			System.out.println(request.getParameter("pageMappingId"));
			int pageMappingId = Integer.parseInt(request.getParameter("pageMappingId"));
			String pageMappingName = request.getParameter("pageMappingName");
			String compileLocation = request.getServletContext().getRealPath("/");

			formUtilityService.dropForm(pageMappingId, pageMappingName, compileLocation);
			logger.info("form dropped");
			logger.info("FormUtilityController.dropForm() end");
		} catch (Exception e) {
			logger.error("dropForm failed(Exception) : " + e, e);
		}
		return new ModelAndView("redirect:index");
	}

	@RequestMapping(value = "/addRegexPattern", method = RequestMethod.POST)
	public @ResponseBody String addRegex(@RequestParam("regexPattern") String regexPattern,
			@RequestParam("name") String name, @RequestParam("validationMsg") String validationMsg,
			@RequestParam("moduleType") String moduleType) {
		logger.info("FormUtilityController.addRegex() start");
		RegexPattern regexObj = new RegexPattern();
		regexObj.setPattern(regexPattern);
		regexObj.setName(name);
		regexObj.setMassage(validationMsg);
		regexObj.setModule(moduleType);

		String regexHtmlData = new String();
		try {
			List<RegexPattern> listRegexPatterns = null;
			if (formUtilityService.insertObjectIntoDB(regexObj)) {
				logger.info("custom regex added");
				listRegexPatterns = formUtilityService.getListRegEx(null);
				regexHtmlData = formUtilityService.getHTMLRegexPatternDataForModule(listRegexPatterns,
						regexObj.getModule());
			}
			logger.info("FormUtilityController.addRegex() end");
			return regexHtmlData;
		} catch (Exception e) {
			logger.error("addRegex failed(Exception) : " + e, e);
		}
		return null;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(ModelMap model, HttpServletRequest request) {
		logger.info("FormUtilityController.index() start");
		System.out.println("...");
		// commonUtility.getIpAndMacAddress();
		try {
			List<RegexPattern> listRegexPatterns = formUtilityService.getListRegEx(null);
			String htmlRegexPatternsForTextModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "TextModule");
			String htmlRegexPatternsForSelectModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "SelectModule");
			String htmlRegexPatternsForNumberModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "NumberModule");
			String htmlRegexPatternsForPasswordModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "PasswordModule");
			String htmlRegexPatternsForRadioModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "RadioModule");
			String htmlRegexPatternsForCheckboxModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "CheckboxModule");
			String htmlRegexPatternsForDateModule = formUtilityService
					.getHTMLRegexPatternDataForModule(listRegexPatterns, "DateModule");

			List<PageMapping> listPageMappings = formUtilityService.getPageMappingData();
			System.out.println(htmlRegexPatternsForTextModule);
			request.setAttribute("htmlRegexPatternsForTextModule", htmlRegexPatternsForTextModule);
			request.setAttribute("htmlRegexPatternsForSelectModule", htmlRegexPatternsForSelectModule);
			request.setAttribute("htmlRegexPatternsForNumberModule", htmlRegexPatternsForNumberModule);
			request.setAttribute("htmlRegexPatternsForPasswordModule", htmlRegexPatternsForPasswordModule);
			request.setAttribute("htmlRegexPatternsForRadioModule", htmlRegexPatternsForRadioModule);
			request.setAttribute("htmlRegexPatternsForCheckboxModule", htmlRegexPatternsForCheckboxModule);
			request.setAttribute("htmlRegexPatternsForDateModule", htmlRegexPatternsForDateModule);
			logger.info("Validation module set");
			model.put("liPageMappings", listPageMappings);
			logger.info("PageMapping data set");

		} catch (NullPointerException e) {
			logger.error("Exception in FormUtilityController -> index() NullPointerException : " + e, e);
			ModelAndView modelAndView = new ModelAndView("home");
			modelAndView.addObject("errMsg", "Something Want worng.");
			return modelAndView;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Exception in FormUtilityController -> index() Exception : " + e, e);
			ModelAndView modelAndView = new ModelAndView("home");
			modelAndView.addObject("errMsg", "Something Want worng.");
			return modelAndView;
		}
		logger.info("FormUtilityController.index() end");
		return new ModelAndView("home");
	}

	@RequestMapping(value = "/getIpAndMacAddress", method = RequestMethod.GET)
	public @ResponseBody String getIpAndMacAddress(HttpServletRequest request) {
		logger.info("FormUtilityController.getIpAndMacAddress() start");
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;

		String userIpAddress = httpServletRequest.getHeader("X-Forwarded-For");

		if (userIpAddress == null) {
			userIpAddress = request.getRemoteAddr();
		}

		String str = "";
		String macAddress = "";
		try {
			Process p = Runtime.getRuntime().exec("nbtstat -A " + userIpAddress);
			InputStreamReader ir = new InputStreamReader(p.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			for (int i = 1; i < 100; i++) {
				str = input.readLine();
				if (str != null) {
					if (str.indexOf("MAC Address") > 1) {
						macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());
						break;
					}
				}
			}
		} catch (IOException e) {
			logger.error("getIpAndMacAddress failed(IOException) : " + e, e);
			e.printStackTrace(System.out);
		}
		logger.info("Ip and Mac address : " + userIpAddress + " - " + macAddress);
		logger.info("FormUtilityController.getIpAndMacAddress() end");
		return userIpAddress + "|" + macAddress;
	}

	/*
	 * @RequestMapping(value="/dataTable" ) public @ResponseBody String
	 * dataTable(@RequestParam("moduleType") String moduleType ){
	 * System.out.println("data_table");
	 * 
	 * //return
	 * "{ 'draw': 1, 'recordsTotal': 57, 'recordsFiltered': 57, 'data': [ [ 'Airi', 'Satou', 'Accountant', 'Tokyo', '28th Nov 08', '$162,700' ]"
	 * ; return
	 * "{ 'data': [ { 'DT_RowId': 'row_1, 'first_name': 'Quynn', 'last_name': 'Contreras', 'updated_date': '2018-01-31', 'registered_date': '2012-04-06' } ] }"
	 * ; }
	 */

	@RequestMapping(value = "/dataTable", method = RequestMethod.GET)
	public @ResponseBody void dataTable(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("data_table");
		JsonObject jsonResponse = new JsonObject();
		/*
		 * jsonResponse.addProperty("draw", 1);
		 * jsonResponse.addProperty("recordsTotal", 5);
		 * jsonResponse.addProperty("recordsFiltered", 5);
		 */
		JsonArray data = new JsonArray();
		for (int i = 0; i < 25; i++) {
			JsonArray row = new JsonArray();
			row.add(new JsonPrimitive("Quynn"));
			row.add(new JsonPrimitive("Contreras"));
			row.add(new JsonPrimitive("2018-01-31"));
			row.add(new JsonPrimitive("2018-01-31"));
			row.add(new JsonPrimitive(
					"<a href='#' value='parth' onclick=\"myfuncion('parth')\" >Edit</a> / <a href='#' >Delete</a>"));
			data.add(row);
		}
		System.out.println(" : " + data.toString());
		jsonResponse.add("data", data);
		response.setContentType("application/Json");
		response.getWriter().print(jsonResponse.toString());
		String str = "{\"data\":[[\"Accountant\",\"Tokyo\",\"28th Nov 08\",\"162700\"]]}";
		System.out.println(str + " : " + jsonResponse.toString());
		// return
		// "{\"data\":[[\"Quynn\",\"Contreras\",\"2018-01-31\",\"2018-01-31\"]]}";
		// return "{ 'data': [ { 'DT_RowId': 'row_1, 'first_name': 'Quynn',
		// 'last_name': 'Contreras', 'updated_date': '2018-01-31',
		// 'registered_date': '2012-04-06' } ] }";
	}

	@RequestMapping(value = "jsonUsingRest", method = RequestMethod.POST)
	@ResponseBody
	public void jsonUsingRest(HttpServletRequest requestm, HttpServletResponse response, @RequestBody String json)
			throws IOException {
		PrintWriter out = response.getWriter();
		// String json2 = "{ \"recordsTotal\": 3, \"recordsFiltered\":
		// 3,\"demo\":[{\"code\":\"asd1\",\"num\":1,\"id\":1},{\"code\":\"2131\",\"num\":3,\"id\":2},{\"code\":\"2\",\"num\":1,\"id\":4},{\"code\":\"1\",\"num\":1,\"id\":5},{\"code\":\"1\",\"num\":1,\"id\":6},{\"code\":\"3\",\"num\":3,\"id\":7},{\"code\":\"2\",\"num\":2,\"id\":8}],\"start\":1,\"length\":3,\"search\":{\"value\":\"\",\"regex\":false}
		// }";
		String json2 = "{\"draw\":1,\"start\":0,\"length\":5,\"search\":{\"value\":\"\",\"regex\":false},\"demo\":[{\"code\":\"asd1\",\"num\":1,\"id\":1},{\"code\":\"2131\",\"num\":3,\"id\":2},{\"code\":\"a\",\"num\":10,\"id\":9},{\"code\":\"2\",\"num\":1,\"id\":4},{\"code\":\"1\",\"num\":1,\"id\":5}],\"recordsTotal\":16,\"recordsFiltered\":16}";
		System.out.println("json : " + json);
		System.out.println("json2 : " + json2);
		out.println(json2);
	}

	@RequestMapping(value = "/listForDatatable/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restListForDatatable(@PathVariable("path") String path, @RequestBody String json,
			HttpServletRequest request) throws Exception {
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		// String remainingPaths = (String)
		// request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		Map<String, String> result = new HashMap<>();
		String response = "";
		RestOperation rest = new RestOperation();
		try {
			Class<?> clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			System.err.println(json);
			response = rest.searchForDataTable(clazz, json);
			System.out.println("response : " + response);
			// {"ID": "3", "code": "2", "num": "2"} update demo
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return response;
	}

	@RequestMapping(value = "/insert/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restInsert(@PathVariable("path") String path, @RequestBody String json, HttpServletRequest request) throws Exception {
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		// String remainingPaths = (String)
		// request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		Map<String, String> result = new HashMap<>();
		//System.out.println("json : " + json + " ,data is : " + request.getParameter("code"));
		System.out.println("json : data is : ");
		String jsonResponse = null;
		RestOperation rest = new RestOperation();
		
		try {
			Class<?> clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			System.out.println("clazz : " + clazz);
			
			// converting Checkbox Array to String
			StringBuffer buf = new StringBuffer(json);
	        if(buf.toString().indexOf("[") != -1 && buf.toString().indexOf("]") != -1) {
	            int start = buf.indexOf("[")+1;
	            int end = buf.indexOf("]");
	            buf = new StringBuffer(buf.toString().replace("[","").replace("]",""));
	            buf.replace(start, end, buf.substring(start,end).replaceAll("\",\"",","));
	            System.out.println(buf);
	            json = buf.toString();
	        }
	        
			jsonResponse = rest.insert(clazz, json);
			System.out.println("jsonResponse : " + jsonResponse);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonResponse;
	}
	
	@RequestMapping(value = "/insertWithFile/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restInsertWithFile(@PathVariable("path") String path, HttpServletRequest request, 
			 MultipartHttpServletRequest request1) throws Exception {
		/*@RequestParam(required = false) CommonsMultipartFile file,*/
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		Map<String, String> result = new HashMap<>();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		//System.err.println("file : " + file);
		//System.out.println("json : data is : " + file.getOriginalFilename());
		String jsonResponse = null;
		RestOperation rest = new RestOperation();
		String fileName[] = new String[10];
		String fileId[] = new String[10];
		
		Iterator<String> itrator = request1.getFileNames();
		int i=0;
		int j=0;
		while(itrator.hasNext()) {
			List<MultipartFile> multipartFiles = request1.getFiles(itrator.next());
			String str = "";
			for(MultipartFile multipartFile : multipartFiles) {
				String fileName1 = multipartFile.getOriginalFilename();
		        System.out.println("File Name:" +fileName1);
				if (multipartFile != null && !fileName1.equals("")) {
					DateFormat dateFormat = new SimpleDateFormat("MMddyyyyHHmmssS");
					str += dateFormat.format(new Date())+j+"_"+path+".txt|";
					//System.err.println(str);
					j++;
				}
			}
			if(str.length() != 0) {
				fileName[i] = str.substring(0,str.length()-1);
			} else {
				fileName[i] = "";
			}
			System.out.println("fileName[i] : " + fileName[i]);
			i++;
		}
		
		Class<?> clazz;
		try {
			clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			Object clsObject = clazz.newInstance();
			System.out.println(request.getParameter("code")+"-" + clsObject.getClass());
			//json = commonUtility.bindDataInJson(clsObject, clsObject.getClass(), request, request1, fileName);
			Map<String, String> map = formUtilityService.checkFileValidation(path, request1);
			if(map != null) {
				//json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(dataObject);
				if (map.containsKey("success")) {
					itrator = request1.getFileNames();
					i=0;
					while(itrator.hasNext()) {
						j=0;
						String str = "";
						List<MultipartFile> multipartFiles = request1.getFiles(itrator.next());
						String filenameArray[] = fileName[i].split("\\|");
						for(MultipartFile multipartFile : multipartFiles) {
							System.out.println("input type name :" + multipartFile.getName());
					        System.out.println("File Length:" + multipartFile.getBytes().length);
					        System.out.println("File Type:" + multipartFile.getContentType());
					        String fileName1 = multipartFile.getOriginalFilename();
					        System.out.println("File Name: " +fileName1);

					        FileUpload fileUpload = new FileUpload();
							//fileUpload.setTableId(id.intValue());
							//fileUpload.setTableName(path);
							if(multipartFile.getBytes().length != 0) {
								fileUpload.setFileName(filenameArray[j]);
								fileUpload.setOriginalName(fileName1);
								fileUpload.setExtension(fileName1.substring(fileName1.lastIndexOf(".")));
								fileUpload.setLocation(commonUtility.getValueFromPropertieFile("imagePath"));
								str += formUtilityService.uploadFile(fileUpload, multipartFile)+"|";
							} else {
								fileUpload.setFileName("");
								fileUpload.setOriginalName("");
								fileUpload.setExtension("");
								fileUpload.setLocation("");
							}
							j++;
						}
						if(str.length() != 0) {
							fileId[i] = str.substring(0,str.length()-1);
						} else {
							fileId[i] = "";
						}
						System.out.println("fileId[i] : " + fileId[i]);
						i++;
					}
					json = commonUtility.bindDataInJson(clsObject, clsObject.getClass(), request, request1, fileId);
					jsonResponse = rest.insert(clazz, json);
					System.out.println("Current Path : " + request.getServletContext().getRealPath("/"));
				} else if(map.containsKey("nofile")){
					json = commonUtility.bindDataInJson(clsObject, clsObject.getClass(), request, null, null);
					jsonResponse = rest.insert(clazz, json);
				} else {
					jsonResponse = "{\"error\":";
					for (Map.Entry<String, String> errorMsg : map.entrySet()) {
						jsonResponse += "{\"File\":\""+errorMsg.getValue()+"\"}";
					}
					jsonResponse += "}";
				}
			} else {
				jsonResponse = "{\"error\":{\"error\":\"Insertion problem.\"}}";
			}
			System.err.println("jsonResponse : " + jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResponse;
	}
	
	@RequestMapping(value = "/update/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restUpdate(@PathVariable("path") String path, @RequestBody String json, HttpServletRequest request) {
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		// String remainingPaths = (String)
		// request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		Map<String, String> result = new HashMap<>();
		System.out.println(json + "data is" + request.getParameter("code"));
		String jsonResponse = null;
		RestOperation rest = new RestOperation();
		try {
			Class<?> clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			System.out.println("clazz : " + clazz);
			
			// converting Checkbox Array to String
			StringBuffer buf = new StringBuffer(json);
	        if(buf.toString().indexOf("[") != -1 && buf.toString().indexOf("]") != -1) {
	            int start = buf.indexOf("[")+1;
	            int end = buf.indexOf("]");
	            buf = new StringBuffer(buf.toString().replace("[","").replace("]",""));
	            buf.replace(start, end, buf.substring(start,end).replaceAll("\",\"",","));
	            System.out.println(buf);
	            json = buf.toString();
	        }
			jsonResponse = rest.update(clazz, json);
			System.out.println("jsonResponse : " + jsonResponse);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonResponse;
	}

	@RequestMapping(value = "/updateWithFile/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restUpdateWithFile(@PathVariable("path") String path, HttpServletRequest request, 
			 MultipartHttpServletRequest request1) throws Exception {
		System.err.println("ID " + request.getParameter("ID"));
		
		int id = Integer.parseInt(request.getParameter("ID"));
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		String json = null;
		String jsonResponse = null;
		RestOperation rest = new RestOperation();
		String fileName[] = new String[10];
		String fileId[] = new String[10];
		
		Iterator<String> itrator = request1.getFileNames();
		int i=0;
		int j=0;
		while(itrator.hasNext()) {
			List<MultipartFile> multipartFiles = request1.getFiles(itrator.next());
			String str = "";
			for(MultipartFile multipartFile : multipartFiles) {
				String fileName1 = multipartFile.getOriginalFilename();
		        System.out.println("File Name:" +fileName1);
				if (multipartFile != null && !fileName1.equals("")) {
					DateFormat dateFormat = new SimpleDateFormat("MMddyyyyHHmmssS");
					str += dateFormat.format(new Date())+j+"_"+path+".txt|";
					j++;
				}
			}
			if(str.length() != 0) {
				fileName[i] = str.substring(0,str.length()-1);
			} else {
				fileName[i] = "";
			}
			System.out.println("fileName[i] : " + fileName[i]);
			i++;
		}
		
		Class<?> clazz;
		try {
			clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			Object clsObject = clazz.newInstance();
			System.out.println(request.getParameter("code")+"-" + clsObject.getClass());
			//json = commonUtility.bindDataInJson(clsObject, clsObject.getClass(), request, request1, fileName);
			//Integer id = new Integer(0);
			Map<String, String> map = formUtilityService.checkFileValidation(path, request1);
			if(map != null) {
				//json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(dataObject);
				if (map.containsKey("success")) {
					if(formUtilityService.deleteUploadedFile(path, id)){
						itrator = request1.getFileNames();
						i=0;
						while(itrator.hasNext()) {
							j=0;
							String str = "";
							List<MultipartFile> multipartFiles = request1.getFiles(itrator.next());
							String filenameArray[] = fileName[i].split("\\|");
							for(MultipartFile multipartFile : multipartFiles) {
								System.out.println("input type name :" + multipartFile.getName());
						        System.out.println("File Length:" + multipartFile.getBytes().length);
						        System.out.println("File Type:" + multipartFile.getContentType());
						        String fileName1 = multipartFile.getOriginalFilename();
						        System.out.println("File Name: " +fileName1);

						        FileUpload fileUpload = new FileUpload();
								//fileUpload.setTableId(id);
								//fileUpload.setTableName(path);
								if(multipartFile.getBytes().length != 0) {
									fileUpload.setFileName(filenameArray[j]);
									fileUpload.setOriginalName(fileName1);
									fileUpload.setExtension(fileName1.substring(fileName1.lastIndexOf(".")));
									fileUpload.setLocation(commonUtility.getValueFromPropertieFile("imagePath"));
									str += formUtilityService.uploadFile(fileUpload, multipartFile)+"|";
								} else {
									fileUpload.setFileName("");
									fileUpload.setOriginalName("");
									fileUpload.setExtension("");
									fileUpload.setLocation("");
								}
								j++;
							}
							if(str.length() != 0) {
								fileId[i] = str.substring(0,str.length()-1);
							} else {
								fileId[i] = "";
							}
							i++;
						}
						json = commonUtility.bindDataInJson(clsObject, clsObject.getClass(), request, request1, fileId);
						jsonResponse = rest.update(clazz, json);
					}
					System.out.println("Current Path : " + request.getServletContext().getRealPath("/"));
				} else if(map.containsKey("nofile")){
					json = commonUtility.bindDataInJson(clsObject, clsObject.getClass(), request, null, null);
					jsonResponse = rest.insert(clazz, json);
				} else {
					jsonResponse = "{\"error\":";
					for (Map.Entry<String, String> errorMsg : map.entrySet()) {
						jsonResponse += "{\"File\":\""+errorMsg.getValue()+"\"}";
					}
					jsonResponse += "}";
				}
			} else {
				jsonResponse = "{\"error\":{\"error\":\"Updation problem.\"}}";
			}
			System.err.println("jsonResponse : " + jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResponse;
	}
	
	@RequestMapping(value = "/delete/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restDelete(@PathVariable("path") String path, @RequestBody String json, HttpServletRequest request) {
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		// String remainingPaths = (String)
		// request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		Map<String, String> result = new HashMap<>();
		System.out.println(json + " data is " + request.getParameter("code"));
		String jsonResponse = null;
		RestOperation rest = new RestOperation();
		try {
			Class<?> clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			System.out.println("clazz : " + clazz);
			jsonResponse = rest.delete(clazz, json);
			System.out.println("jsonResponse : " + jsonResponse);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonResponse;
	}

	@RequestMapping(value = "/restFatchDataFromID/{path}", method = RequestMethod.POST)
	@ResponseBody
	public String restFatchDataFromID(@PathVariable("path") String path, @RequestBody String json, HttpServletRequest request) {
		String className = path.substring(0, 1).toUpperCase() + path.substring(1);
		// String remainingPaths = (String)
		// request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		Map<String, String> result = new HashMap<>();
		String response = "";
		RestOperation rest = new RestOperation();
		try {
			Class<?> clazz = Class.forName(commonUtility.getValueFromPropertieFile("beanPackage") + "." + className);
			System.out.println("id : " + Integer.parseInt(request.getParameter("id")));
			response = rest.getDataFromId(clazz, Integer.parseInt(request.getParameter("id")));
			
			// {"ID": "3", "code": "2", "num": "2"} update demo
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return response;
	}

	
	@RequestMapping(value = "/downloadFile/{path}", method = RequestMethod.POST)
	@ResponseBody
	public void downloadFile(@PathVariable("path") String path, @RequestBody String json, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Class<?> clazz;
		try {
			System.out.println("fileID : " + request.getParameter("fileId"));
			// List<Object> list = formUtilityService.getListDataFromModelNameById("FileUpload", request.getParameter("fileId"));

			clazz = Class.forName("com.bean.FileUpload");

			FileUpload document = new FileUpload();
			document = (FileUpload) formUtilityService.getDataById(clazz,Integer.valueOf(request.getParameter("fileId")));
			if (document != null) {
				response.setContentType(document.getFileType());
		        
		        try {
		        	if(document != null) {
		        		//String fileName = document.getFileName().substring(0,document.getFileName().lastIndexOf('.'))+document.getExtension();
		        		ServletContext context = request.getServletContext();
			    		String appPath = context.getRealPath("");
			    		String fullPath = document.getLocation() + "/" + document.getFileName();
			    		
			    		System.out.println("fullPath = " + fullPath + " - " + document.getFileName());
			        	File file = new File(fullPath);
			        	FileInputStream in = new FileInputStream(fullPath);
			        	
			        	byte dataRead[] =new byte[(int) file.length()];
			        	in.read(dataRead);
			        	byte descrypt[] = CryptoUtils.decrypt("Silvertouch java",dataRead );
			        	//document.setFile(descrypt);
			        	response.setContentLength(descrypt.length);
				        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getOriginalName() +"\"");
				        
				        FileCopyUtils.copy(descrypt, response.getOutputStream());
				        in.close();
		        	}
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/audit/audtiRerport", method = RequestMethod.GET)
	public String audtiRerport(ModelMap model, HttpServletRequest request) {
		return "AuditReport";
	}
	@RequestMapping(value = "/audtiRerportRest", method = RequestMethod.POST)
	@ResponseBody
	public String audtiRerportRest(@RequestBody String json, HttpServletRequest request, HttpSession session) {
		System.out.println("FormUtilityController.audtiRerport()" + json);
		String fromDate = request.getParameter("fromdate");
		String action = request.getParameter("action");
		String toDate = request.getParameter("todate");
		
		StringBuilder tableData= 	formUtilityService.getAuditLog(action,fromDate,toDate,json);
		
		return tableData.toString();
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		try {
			logger.info("In doFilter");
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpSession session = httpRequest.getSession();
			if (session != null) {
				logger.info("sessionId : " + session.getId() + " set");
				MDC.put("sessionId", session.getId());
			}
			chain.doFilter(request, response);
		} catch (Exception e) {
			logger.error("doFilter failed : " + e, e);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
}
