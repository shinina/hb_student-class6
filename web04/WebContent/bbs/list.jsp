<%@ page import="com.bbs.bean.BbsBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.ArrayList"%>
<%!
	private final String driver = "oracle.jdbc.driver.OracleDriver";
    private final String url = "jdbc:oracle:thin:@localhost:1521/xe";
    private final String user = "scott";
    private final String password = "tiger";
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private ArrayList<BbsBean> list;
%>
<%
	list = new ArrayList<BbsBean>();
	String sql = "select * from bbs01";
    try{
    	Class.forName(driver);
    	conn = DriverManager.getConnection(url, user, password);
    	pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();
    	while(rs.next()){
    		BbsBean bean = new BbsBean();
    		bean.setRnum(rs.getInt("rnum"));
    		bean.setTitle(rs.getString("title"));
    		bean.setId(rs.getString("id"));
    		bean.setNalja(rs.getDate("nalja"));
    		bean.setCnt(rs.getInt("cnt"));
    		list.add(bean);
    	}
    }catch(Exception ex){
    	out.println("신속히 조치하도록 하겠습니다.");
    }finally{
        if(rs!=null)rs.close();
        if(pstmt!=null)pstmt.close();
        if(conn!=null)conn.close();
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/template/header.jsp"%>
	<center>
	<h1>게시판 리스트 페이지</h1>
	<table border="1" width="70%">
		<tr>
			<th width="50">순서</th>
			<th>제목</th>
			<th width="80">글쓴이</th>
			<th width="80">날짜</th>
			<th width="50">조회수</th>
		</tr>
		<%
		for(BbsBean bean:list){
		%>
		<tr>
			<td><%=bean.getRnum() %></td>
			<td><a href="detail.jsp?idx=<%=bean.getRnum()%>"><%=bean.getTitle() %></a></td>
			<td><%=bean.getId() %></td>
			<td><%=bean.getNalja() %></td>
			<td><%=bean.getCnt() %></td>
		</tr>
		<%} %>
	</table>
	<h3><a href="addform.jsp">추가하기</a></h3>
	</center>
<%@ include file="/template/footer.jsp"%>
