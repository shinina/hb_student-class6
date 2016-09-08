<%@ page import="com.guest.model.GuestDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8");
	//String name = request.getParameter("name");
    //if(name!=null && ("".equals(name) || "null".equals(name))){
   	// 버튼을 눌렀을 때
  if(request.getMethod().equals("POST")){
	  System.out.println(request.getMethod());
 
    String name = request.getParameter("name");
    String stpay = request.getParameter("pay");
    name = name.trim();
    stpay = stpay.trim();
    boolean ispay = false;
    for(int i=0; i<stpay.length(); i++){
    	if((int)stpay.charAt(i)>=(int)'0' && (int)stpay.charAt(i)<=(int)'9'){
    		//숫자정상입력
    	}else{
    		ispay = true; //문자가 하나라도 있으면 다시 입력하라
    	}
    }
    String re = "list.jsp";
    if(name==null||"".equals(name)||ispay){
    	re="insert.jsp";
    }else{
    	// db insert
    	System.out.println("db insert");
    	int pay = Integer.parseInt(stpay);
    	GuestDao dao = new GuestDao();
    	if(dao.insertOne(name,pay)>0){
    		//정상입력
    		re = "list.jsp";
    	}else{
    		re = "insert.jsp";
    	}
    	// insertOne(name,pay);
    }
    response.sendRedirect(re);
  }else{
        System.out.println(request.getMethod());
    	//response.sendRedirect("insert.jsp");
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insert.jsp" method="POST">
	<h1>입력 페이지</h1>
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>금액</td>
			<td><input type="text" name="pay"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="입력">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>