<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%!  //�����
	public int sum(int a, int b){
		return a+b;
	}
%>
<body>
	<h1>��ũ��Ʈ�� Ư¡</h1>
	<h2>1~10������ ��</h2>
	
	<%
	int sum = 0;
	for(int i=1;i<=50;i++){
		sum+=i;
		out.print(i);
		if(i!=50){
			%>
			+
			<%
		}
	}
	out.print("=");
	%>
	<font size="16">
	<%=sum%>
	<%//ǥ���� %>
	</font>
	<br>
	
	100+5=<%=sum(100,5) %>
	<%
	   Calendar cal = Calendar.getInstance();
	   out.print(cal.get(Calendar.DATE));
	%>
	<br>
	<%
	Date date = new Date();
	out.print(date);
	%>
</body>
</html>