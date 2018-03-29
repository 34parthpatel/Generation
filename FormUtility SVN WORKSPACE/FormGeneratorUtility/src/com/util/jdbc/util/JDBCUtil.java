package com.util.jdbc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

@Repository("jdbcUtil")
public class JDBCUtil {

	public Connection getConnection() throws ClassNotFoundException{
		String driverName = "com.mysql.jdbc.Driver";
	    Class.forName(driverName);

	    String serverName = "192.168.6.59";
	    String portNumber = "3306";
	    String mydatabase = serverName + ":" + portNumber;
	    String url = "jdbc:mysql://" + mydatabase + "/test";
	    String username = "root";
	    String password = "";
	    Connection connection=null;
	    try {
			connection = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return connection;
	}
	/*public void poolConnection(){
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		 String serverName = "192.168.6.59";
	     String portNumber = "3306";
	     String mydatabase = serverName + ":" + portNumber;
	     String url = "jdbc:mysql://" + mydatabase + "/test";
		try {
			cpds.setDriverClass( "com.mysql.jdbc.Driver" );
			cpds.setJdbcUrl( url );
			cpds.setUser("root");
			cpds.setPassword("");
			cpds.setMinPoolSize(5);
			cpds.setAcquireIncrement(5);
			cpds.setMaxPoolSize(20);
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //loads the jdbc driver
		//cpds.getConnection().

	}*/
}
