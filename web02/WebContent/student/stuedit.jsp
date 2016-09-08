<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int idx = Integer.parseInt(request.getParameter("idx"));
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		String sql = "update studentp3 set kor="+kor+", eng="+eng+", math="+math+" where idx="+idx;
		
		System.out.println(sql);
		
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String user = "scott";
		String password = "tiger";
		Connection conn = null;
		Statement stmt = null;
		int result = -1;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
			if(result>=0){
				response.sendRedirect("stulist.jsp");
			}else{
				response.sendRedirect("stuadd.jsp");
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			out.println("빠른 시일내에 복구하겠습니다.");
		}finally{
			if(conn!=null)conn.close();
			if(stmt!=null)stmt.close();
		}	
	%>
</body>
</html>