<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
		//String sql = "select rownum rn, a.* from guest a order by a.sabun desc ";
		//String sql2 = "select count(sabun) as cnt from guest";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
%>
<body>
	<%
		int sabun = Integer.parseInt(request.getParameter("sabun"));
	    String name = request.getParameter("name");
        String sql = "select count(*) as cnt from guest where sabun="+sabun+" and name='"+name+"'";
        System.out.println(sql);
        try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				cnt = rs.getInt("cnt");
			}
	        if(cnt>0){
	        	response.sendRedirect("./guest/list.jsp");
	        }else{
	        	%>
	        	<h1>로그인 실패</h1>
	        	<a href="index.jsp">로그인페이지로 돌아가기</a>
	        	<%
	        }
	    }catch(Exception ex){
	    	out.println("신속히 조치하겠습니다.");
	    }finally{
	    	if(rs!=null)rs.close();
	    	if(stmt!=null)stmt.close();
	    	if(conn!=null)conn.close();
	    }
	%>
</body>
</html>