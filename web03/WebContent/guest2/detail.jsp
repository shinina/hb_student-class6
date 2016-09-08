<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
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
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
%>
<body>
	<%
		String sql = "select * from guest where sabun=?";
	    //sql += request.getParameter("idx");
	    int param1 = 0;
	    String param2 = null;
	    Date param3 = null;
	    int param4 = 0;
	    
	    try{
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
	    	conn = DriverManager.getConnection(url, id, pw);
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1,Integer.parseInt(request.getParameter("idx")));
	    	rs = pstmt.executeQuery();
	    	if(rs.next()){
	    		param1 = rs.getInt("sabun");
	    		param2 = rs.getString("name");
	    		param3 = rs.getDate("nalja");
	    		param4 = rs.getInt("pay");
	    	}
	    }catch(Exception ex){
	    	out.println("신속히 조치를 취하겠습니다.");
	    }finally{
	    	if(rs!=null)rs.close();
	    	if(pstmt!=null)pstmt.close();
	    	if(conn!=null)conn.close();
	    }
	%>
	<h2><%=param1 %>상세페이지</h2>
	<table>
		<tr>
			<td width="150" bgcolor="gray" align="center" style="color:yellow;font-weight:bold;">사번</td>
			<td><%=param1 %></td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center" style="color:yellow;font-weight:bold;">이름</td>
			<td><%=param2 %></td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center" style="color:yellow;font-weight:bold;">날짜</td>
			<td><%=param3 %></td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center" style="color:yellow;font-weight:bold;">금액</td>
			<td><%=param4 %></td>
		</tr>
	</table>
	<p>
		<a href="editform.jsp?idx=<%=param1%>&name=<%=param2%>&pay=<%=param4%>">[수정]</a>
		<a href="list.jsp">[삭제]</a>
	</p>
	<h3><a href="list.jsp">GO LIST</a></h3>
</body>
</html>