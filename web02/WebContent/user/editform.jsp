<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
      <% String id = request.getParameter("id");
	     String pw = request.getParameter("pw");
	     String name = request.getParameter("name");
	     System.out.println(id+":"+pw+","+name);
	   %>
		<h1><%=request.getParameter("id")%>님의 수정페이지</h1>
		<form action="update.jsp">
		<p>id:<input type="text" name="id" value="<%=request.getParameter("id")%>"></p>
		<p>pw:<input type="text" name="pw" value="<%=request.getParameter("pw")%>"></p>
		<p>name:<input type="text" name="name"  readonly="readonly" value="<%=request.getParameter("name")%>"></p>
		<p><input type="submit" value="edit"></p>
		</form>
</body>
</html>