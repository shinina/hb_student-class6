<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bbs.bean.BbsBean" import="java.sql.*" import="java.util.ArrayList"%>
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
	String sql = "insert into bbs01 (rnum, title, id, content) values (bbs01_seq.nextval, ?, ?, ?)";
    String title = request.getParameter("title");
    String id = request.getParameter("id");
    String content = request.getParameter("content");
    BbsBean bean = new BbsBean();
    bean.setTitle(title);
    bean.setId(id);
    bean.setContent(content);
    int result=-1;
    try{
    	Class.forName(driver);
    	conn = DriverManager.getConnection(url, user, password);
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, bean.getTitle());
    	pstmt.setString(2, bean.getId());
    	pstmt.setString(3, bean.getContent());
    	result = pstmt.executeUpdate();
    }catch(Exception ex){
    	out.println("신속히 조치하도록 하겠습니다.");
    }finally{
    	if(pstmt!=null)pstmt.close();
    	if(conn!=null)conn.close();
    }
    String redirect = null;
    if(result>0){
    		redirect = "list";
    }else{
    	    redirect = "addform";
    }
    response.sendRedirect(redirect+".jsp");
%>
