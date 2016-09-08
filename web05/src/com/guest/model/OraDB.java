package com.guest.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class OraDB {
    private Connection conn;
    
    public OraDB(){
    	String url = "jdbc:oracle:thin:@203.236.209.201:1521/xe";
    	String user = "scott";
    	String password = "tiger";
    	try{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		conn = DriverManager.getConnection(url, user, password);
    	}catch(Exception ex){
    		System.out.println(ex.getMessage());
    	}
    }
    
    public static Connection getConnection(){
    	 OraDB ora = new OraDB();
    	 Connection conn = ora.conn;
    	 return conn;
    }
}
