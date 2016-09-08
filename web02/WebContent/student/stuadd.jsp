<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="800" align="center">
		<tr height="80">
			<th width="250">
			   <a href="/web02/student/main.jsp">
			   <img alt="logo" src="../img/logo_ai.png" width="200">
			   </a>
			</th>
		    <th width="100"><a href="stulist.jsp">조회</a></th>
			<th width="100"><a href="stuform.jsp">학생등록</a></th>
			<th width="100" bgcolor="red"><a href="stuadd.jsp">성적입력</a></th>
			<th width="100"><a href="studel.jsp">데이터삭제</a></th>
			<th width="*">&nbsp;</th>
		</tr>
		<tr>
		    <td colspan="6" width="800" height="400">
		      <center>
		        <!-- content START -->
		        <h1>성적입력</h1>
		        <form action="stuadd2.jsp">
		        <select name="idx">
		        	<%
		        	String url = "jdbc:oracle:thin:@localhost:1521:xe";
		        	String user = "scott";
		        	String password = "tiger";
		        	String sql = "select idx from studentp3";
		        	Connection conn = null;
		        	Statement stmt = null;
		        	ResultSet rs = null;
		        	System.out.println(sql);
		        	try{
		        	  Class.forName("oracle.jdbc.driver.OracleDriver");	
		        	  conn = DriverManager.getConnection(url, user, password);
		        	  stmt = conn.createStatement();
		        	  rs = stmt.executeQuery(sql);
		        	
		        	int count = 0;
		        	while(rs.next()){
		        		int temp = 0; 
		        		temp = rs.getInt(1);
		        	%>
		        	<option value="<%=temp%>" <%if(count==0){%>selected<%}%>><%=temp%></option>
		        	<%
		        	count++;
		        	}
		        	
		            }catch(Exception ex){
		        		out.println("빠른 시일내에 수리하도록 하겠습니다.");
		        	}finally{
		        		if(conn!=null)conn.close();
		        		if(stmt!=null)stmt.close();
		        		if(rs!=null)rs.close();
		        	}
		        %>
		        </select>
		        
		        <input type="submit" value="학생선택">
		        </form>
		        <!-- content END -->
		      </center>
		    </td>
		</tr>
	</table>
</body>
</html>