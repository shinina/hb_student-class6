<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>������ �̵�</h1>
	<%
	  //out.print("<h1>�������̵�</h1>");
	  //Thread.sleep(3000);
	  
	  //response.sendRedirect("http://naver.com"); //������
	  //response.sendRedirect("ex01.jsp");  //�����
	  response.sendRedirect(request.getContextPath()+"/ex04.jsp");
	  //PrintWriter prn = response.getWriter();
	  //prn.println("����մϴ�");
	%>
</body>
</html>