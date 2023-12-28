<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int cPage = (int) request.getAttribute("page");
	int totalPageCnt = (int) request.getAttribute("totalPageCnt");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
	
	<h1>게시물 목록</h1>
	
	<table border="1">
		<colgroup>
			<col />
			<col width="200"/>
			<col />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>작성일</th>
			<th>제목</th>
		</tr>
		<% for (Map<String, Object> articleMap : articleListMap) { %>
			<tr>
				<td><%= (int) articleMap.get("id") %></td>
				<td><%= (LocalDateTime) articleMap.get("regDate") %></td>
				<td><a href="detail?id=<%= (int) articleMap.get("id") %>"><%= (String) articleMap.get("title") %></a></td>
			</tr>
		<% } %>
	</table>
	
	<div>
		<a href="../home/main">메인으로 돌아가기</a>
	</div>
	
	<style type="text/css">
		.paging > .red {
			color:red;
			font-size: 1.25rem;
		}
	</style>
	
	<div class="paging">
		<% for (int i = 1; i <= totalPageCnt; i++) { %>
			<a class="<%= cPage == i ? "red" : "" %>" href="?page=<%= i %>"><%= i %></a>
		<% } %>
		
	</div>
</body>
</html>