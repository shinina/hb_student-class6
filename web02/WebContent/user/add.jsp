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
	  String id = request.getParameter("id");
	  String pw = request.getParameter("pw");
	  String name = request.getParameter("name");
	  System.out.println(id+":"+pw+","+name);
	
	  String url = "jdbc:oracle:thin:@localhost:1521/xe";
	  String user = "scott";
	  String password = "tiger";
	  String sql = "insert into guestuser values('"+id+"','"+pw+"','"+name+"')";
			  
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection conn = DriverManager.getConnection(url, user, password);
	  Statement stmt = conn.createStatement();
	  int cnt = stmt.executeUpdate(sql);
	  if(cnt>0){
		  out.print("<h1>정상입력 되었습니다</h1>");
	  }else{
		  out.print("<h1>입력실패</h1>");
	  }
	  System.out.println(sql);
	%>
	<h1><a href="userlist.jsp">[list go]</a></h1>
	
</body>
</html>