<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>���ξ� jsp ������ �Դϴ�.</h1>
		<%
		  int a=100;
		  int b=2;
		  System.out.println("�ܼ�â ���");
		  out.write("a�̹��� �������� ���<br>");
		  //out.println("������ �ι�°�� ���<br>");
		  out.println("<!--html�ּ�2--><br>"+a*b);
		%>
		<!--html -->
	</body>
</html>