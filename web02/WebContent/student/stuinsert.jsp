<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	
	Connection conn = null;
	Statement stmt = null;
	String sql = "insert into studentp3 (idx, name) values("+idx+",'"+name+"')";
	System.out.println(sql);
	int result = -1;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		result = stmt.executeUpdate(sql);
		if(result>=0){
			//out.print("<h1>입력성공</h1>");
			response.sendRedirect("/web02/student/stulist.jsp");
		}else{
			//out.print("<h1>입력실패</h1>");
			response.sendRedirect("/web02/student/stuform.jsp");
		}
	}catch(ClassNotFoundException ex){
		System.out.println("드라이버 로딩 확인");
		out.println("빠른 시일 복구하겠습니다.");
	}catch(Exception ex){
		System.out.println("오라클 명령 확인");
		out.println("빠른 시일 복구하겠습니다.");
	}finally{
		if(conn!=null)conn.close();
	}
	
	%>
</body>
</html>