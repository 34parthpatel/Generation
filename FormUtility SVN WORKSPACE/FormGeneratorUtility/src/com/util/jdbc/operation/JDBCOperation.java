package com.util.jdbc.operation;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.jdbc.util.JDBCUtil;

public class JDBCOperation {

	public boolean createTable(String query)
	{
		
		Connection connection = null;
		Statement statement = null;
		
		try
		{
			connection = new JDBCUtil().getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);
			//connection.commit();
			return true;
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return false;
	}
}
