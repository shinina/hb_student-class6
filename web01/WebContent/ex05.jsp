<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>기본 내장객체</h1>
	<%
	  String addr = request.getRemoteAddr();
	  out.println("접근자 주소:"+addr);
	  out.print("인코딩 포멧:"+request.getCharacterEncoding());
	  out.println("<br>서버 프로토콜:"+request.getProtocol());
	  out.println("<br>서버 컨텍스트 경로:"+request.getContextPath());
	  out.println("<br>페이지 경로:"+request.getRequestURI());
	  out.println("<br>서버명:"+request.getServerName());
	  out.println("<br>서버 포트:"+request.getServerPort());
	%>
</body>
</html>