<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�⺻ ���尴ü</h1>
	<%
	  String addr = request.getRemoteAddr();
	  out.println("������ �ּ�:"+addr);
	  out.print("���ڵ� ����:"+request.getCharacterEncoding());
	  out.println("<br>���� ��������:"+request.getProtocol());
	  out.println("<br>���� ���ؽ�Ʈ ���:"+request.getContextPath());
	  out.println("<br>������ ���:"+request.getRequestURI());
	  out.println("<br>������:"+request.getServerName());
	  out.println("<br>���� ��Ʈ:"+request.getServerPort());
	%>
</body>
</html>