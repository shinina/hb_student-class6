<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%!
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String id = "scott";
		String pw = "tiger";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
%>
<body>
<%
    String sql = "update guest set ";
	sql += "name='"+request.getParameter("name")+"',";
	sql += "nalja=sysdate,";
	sql += "pay="+request.getParameter("pay");   
	sql += " where sabun="+request.getParameter("sabun");
    System.out.println(sql);
	
    try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    conn = DriverManager.getConnection(url, id, pw);
	    stmt = conn.createStatement();
	    cnt = stmt.executeUpdate(sql);
    }catch(Exception ex){
    	out.println("신속히 조치하도록 하겠습니다.");
    }finally{
    	if(rs!=null)rs.close();
    	if(stmt!=null)stmt.close();
    	if(conn!=null)conn.close();
    }
    if(cnt>0)response.sendRedirect("list.jsp");
%>
<h1>수정실패</h1>
<p><a href="detail.jsp?idx=<%=request.getParameter("sabun")%>">돌아가기</a></p>
</body>
</html>