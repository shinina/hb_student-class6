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
			<th width="100" bgcolor="red"><a href="stuform.jsp">학생등록</a></th>
			<th width="100"><a href="stuadd.jsp">성적입력</a></th>
			<th width="100"><a href="studel.jsp">데이터삭제</a></th>
			<th width="*">&nbsp;</th>
		</tr>
		<tr>
		    <td colspan="6" width="800" height="400">
		      <center>
		        <!-- content START -->
		        <h1>학생등록</h1>
		        <form action="stuinsert.jsp">
		        	<table>
		        		<tr>
		        		   <td>학번</td>
		        		   <td><input type="text" name="idx"></td>
		        		</tr>
		        		<tr>
		        		    <td>이름</td>
		        		    <td><input type="text" name="name"></td>
		        		</tr>
		        		<tr>
		        		    <td colspan="2">
		        		    	<input type="submit" value="입 력">
		        		    	<input type="reset" value="취 소">
		        		    </td>
		        		</tr>
		        	</table>
		        </form>
		        <!-- content END -->
		      </center>
		    </td>
		</tr>
	</table>
</body>
</html>