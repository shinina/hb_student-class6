<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/template/header.jsp"%>
<br/>
<br/>
<form action="insert.jsp">
	<table>
		<tr>
			<td bgcolor="#eeeeee" width="90">제목</td>
			<td><input type="text" name="title" placeholder="제목없음"></td>
		</tr>
		<tr>
			<td bgcolor="#eeeeee">글쓴이</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td bgcolor="#eeeeee">내용</td>
			<td><textarea name="content" rows="15" cols="30"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글쓰기">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<%@ include file="/template/footer.jsp"%>