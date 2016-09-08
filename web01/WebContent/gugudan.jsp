<%@ page contentType="text/html; charset=utf-8"%>
<html>
	<head><title>구구단 표 외우기</title></head>
	<body>
	<br><br>
	<center><h1>구구단 표 외우기</h1></center>
	<table width="53%" align="center" style="border-top:4px solid brown;border-bottom:4px solid brown;" cellpadding="8" cellspacing="11">
		<tr style="border-bottom:2px solid brown;border-top:4px solid brown;"><%
	    	for(int dan=1; dan<=9; dan++){
		    	%>
	    		<td width="6%" align="center" xstyle="<%if(dan!=9){%>xborder-right:1px solid brown;<%}%>padding-right:15px;" valign="middle"><b><%=dan%>단</b></td>
	    	<%}%></tr><%
		     for(int i=1; i<=9; i++){ %>
		<tr><% 
		    	for(int dan=1; dan<=9; dan++){
		    	%>
		    	<td style="border-top:1px solid brown;<%if(dan!=9){%>xborder-right:1px solid brown;<%}%>padding-right:15px;" valign="middle"><%=dan%>&nbsp;x&nbsp;<%=i%>&nbsp;=&nbsp;<%=dan*i%></td>	
		       <%}%>
		</tr><%}%>
    </table>
	</body>
</html>