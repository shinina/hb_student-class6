<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.guest.model.*" %>
<%@ page import="com.guest.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%
   GuestDao dao = new GuestDao();
   ArrayList<GuestBean> list = dao.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body background="<%=application.getContextPath()%>/imgs/bg.png">
	<h1>GUEST TABLE LIST</h1>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>날짜</th>
			<th>금액</th>
		</tr>
		<% for(int i=0; i<list.size(); i++){
			GuestBean bean = list.get(i);
		%>
		<tr>
			<td><a href="detail.jsp?idx=<%=bean.getSabun()%>"><%=bean.getSabun() %></a></td>
			<td><%=bean.getName() %></td>
			<td><%=bean.getNalja() %></td>
			<td><%=bean.getPay() %></td>
		</tr>
		<%} %>
	</table>
	<h3><a href="insert.jsp">입력</a></h3>
</body>
</html>