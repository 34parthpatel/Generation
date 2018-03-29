package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bean.FileUpload;
import com.bean.PageMapping;
import com.bean.RegexPattern;
import com.bean.TblFormSchema;

public interface FormUtilityDao {
	public void genrateClass();

	public boolean generateClassFromTable(String tableName, String buildPath, Map<String, TblFormSchema> tableFormSchemaMap)  throws Exception;

	public boolean insertData(Object dataObject, Class<?> cls) throws Exception;
	
	public List<TblFormSchema> getTableFormSchemaData(int fk) throws Exception;

	public void generateForm(List<TblFormSchema> list, PageMapping pageMapping, String compileLocation) throws Exception;

	public int insertPageMappingData(PageMapping pageMapping) throws Exception;

	public Map< String, TblFormSchema>  insertFieldData(String[] fld_ctrl,String[] fld_type, String[] fld_lbl, String[] fld_name, String[] fld_size, String[] fld_val,String[] fld_index, 
			String[] regex, String[] date_all, String[] date_past, String[] date_future, String[] start_date, String[] end_date, String[] date_format, int pageMappingId) throws Exception;

	public boolean createTable(String pageName, String[] fld_name, String[] fld_type,
			String[] fld_size, String[] fld_size2, String[] fld_val) throws Exception;

	public PageMapping getPageMappingData(String pageName) throws Exception;

	public boolean updateTableSchema(String pageName, String[] fld_name, String[] fld_type, String[] fld_size, String[] fld_ctrl, String[] fld_val) throws Exception;

	public long deletePageTableFields(int pageId) throws Exception;

	public boolean dropForm(int pageMappingId, String pageMappingName, String compileLocation) throws Exception;

	public List<PageMapping> getPageMappingData() throws Exception;

	public List<TblFormSchema> getListTableFormSchema(String pageMappingId) throws Exception;

	public String generateHTMLFormTableString(List<TblFormSchema> listFormSchemas, List<RegexPattern> listRegexPatterns) throws Exception;

	public List getListDataFromModelName(String modelName) throws Exception;

	public boolean isPageExist(String pageName) throws Exception;

	public String getHTMLRegexPatternData(List<RegexPattern> listRegexPatterns) throws Exception;

	public List<RegexPattern> getListRegEx(String[] regex) throws Exception;

	public boolean insertObjectIntoDB(Object regexObj) throws Exception;

	public Map<String, TblFormSchema> setTableFormSchemaInMap(String[] fld_ctrl, String[] fld_type, String[] fld_lbl,
			String[] fld_name, String[] fld_size, String[] fld_val, String[] fld_index, String[] regex, String[] tooltip, 
			String[] date_all, String[] date_past, String[] date_future, String[] start_date, String[] end_date,
			String[] date_format, String[] required, int pageMappingId) throws Exception;

	public HashMap<String, String> validateFormGenerationData(PageMapping pageMapping,
			Map<String, TblFormSchema> tableFormSchemaMapList) throws Exception;

	public boolean insertFieldData(Map<String, TblFormSchema> tableFormSchemaMapList, int pageMappingId) throws Exception;

	public boolean createTable(String pageName, Map<String, TblFormSchema> tableFormSchemaMapList) throws Exception;

	public boolean updateTableSchema(String pageName, Map<String, TblFormSchema> tableFormSchemaMapList) throws Exception;

	public String getHTMLRegexPatternDataForModule(List<RegexPattern> listRegexPatterns, String moduleName) throws Exception;

	public boolean deletePageMappingFromPageName(String pageName) throws Exception;

	public boolean regenerateTableAndForm(int pageId, String pageName,
			List<TblFormSchema> listCurrentTblFormSchemaData, String buildPath) throws Exception;

	public boolean updateObject(Object obj) throws Exception;

	public Integer uploadFile(FileUpload fileUpload, MultipartFile file) throws Exception;

	public Integer insertDataRestunAutoGenratedId(Object dataObject, Class<? extends Object> cls);

	public List<Object> getListDataFromModelNameById(String modelName, String fileName)
			throws Exception;

	public List<Object> getPageMappingDataByName(String name) throws Exception;

	public Map<String, String> checkFileValidation(String path, MultipartHttpServletRequest file) throws Exception;

	public boolean deleteUploadedFile(String path, int id) throws Exception;

	public Object getDataById(Class<?> type, Integer id) throws Exception;

	public StringBuilder getAuditLog(String action, String fromDate, String toDate, String json);
	
}
