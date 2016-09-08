<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	  String name = request.getParameter("name");
	  String sql = "delete from guestuser where name='"+name+"'";
	  System.out.println(sql);	  
	  String url = "jdbc:oracle:thin:@localhost:1521/xe";
	  String user = "scott";
	  String password = "tiger";
	  
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection conn = DriverManager.getConnection(url, user, password);
	  Statement stmt = conn.createStatement();
	  int result = stmt.executeUpdate(sql);
	 //int result = 0;
	  if(result>0){
	%>
	  <h1><%=name%>삭제성공</h1>
	<%}else{%>
	  <h1><%=name%>삭제실패</h1>
	<%}%>
	  <h2><a href="userlist.jsp">[리스트 GO]</a></h2>
</body>
</html>