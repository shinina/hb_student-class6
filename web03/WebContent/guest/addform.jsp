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
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
%>
<body>
<%		
        String sql = "select max(sabun) as cnt from guest";
		System.out.println(sql);
        try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				cnt = rs.getInt("cnt");
				cnt+=1111;
			}
		}catch(Exception ex){
			out.println("신속히 조치하겠습니다.");
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
    %>
	<h1>입력페이지</h1>
	<form action="insert.jsp">
		<table>
			<tr>
				<td>사번</td>
				<td><input type="text" name="sabun" readonly value="<%=cnt%>"></td>
			</tr>
			<tr>
			    <td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
			    <td>금액</td>
				<td><input type="text" name="pay"></td>
			</tr>
			<tr>
			    <td colspan="2">
			    	<input type="submit" value="입력">
			    	<input type="reset" value="취소">
			    </td>
			</tr>
		</table>
	</form>
</body>
</html>