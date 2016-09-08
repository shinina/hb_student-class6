<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
	String sabun = request.getParameter("idx");
	String name = request.getParameter("name");
	String pay = request.getParameter("pay");
%>
	<h1>수정페이지</h1>
	<form action="update.jsp">
	<table>
		<tr>
			<td>사번</td>
			<td><input type="text" name="sabun" value="<%=sabun%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>금액</td>
			<td><input type="text" name="pay" value="<%=pay%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			 <input type="submit" value="수정">
			 <input type="reset" value="취소">
			</td>
	</table>
	<h3><a href="list.jsp">GO LIST</a></h3>
	</form>
</body>
</html>