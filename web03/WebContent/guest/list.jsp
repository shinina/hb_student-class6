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
		String sql = "select rownum rn, a.* from guest a order by a.sabun desc ";
		String sql2 = "select count(sabun) as cnt from guest";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
%>
<body>
	<h1>사원목록</h1>
	<table border="1" width="80%">
		<tr>
		    <th>번호</th>
			<th>사번</th>
			<th>성명</th>
			<th>날짜</th>
			<th>금액</th>
			<th>detail</th>
		</tr>
		<% 
		System.out.println(sql);
		System.out.println(sql2);
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getInt("rn") %></td>
				<td><%=rs.getInt("sabun") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getDate("nalja") %></td>
				<td><%=rs.getInt("pay") %></td>
				<td><a href="detail.jsp?idx=<%=rs.getInt("sabun") %>">detail</a></td>
			</tr>
			<%}
		}catch(Exception ex){
			out.println("신속히 복구하도록 하겠습니다.");
			System.out.println("문제있음");
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			//if(conn!=null)conn.close();
		}
	%>
	</table>
	<%
	try{
		stmt = conn.createStatement();
	    rs = stmt.executeQuery(sql2);
	    if(rs.next()){
	    	cnt = rs.getInt("cnt");
	    }
	%>
	<h3>총인원: <%=cnt %>명</h3>
	<%}catch(Exception ex){
	    out.println("신속히 시정하도록 하겠습니다");
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	%>
</body>
</html>