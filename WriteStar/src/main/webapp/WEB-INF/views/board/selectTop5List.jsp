<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td { text-align: center; }
</style>
</head>
<body>
	<h1>selectTop5List.jsp 페이지</h1>
	<h2>현재 세션 : ${login.email}</h2>
	<a href="/friend/friendRequestPage?to_user=${login.email}">친구목록</a>
	<hr>
	<div>
		<h1>인기 게시글</h1>
		<table width="100%">
			<thead>
		        <tr>
		            <th>title</th>
		            <th>nickname</th>
		        </tr>
		    </thead>
		    <c:forEach items="${topList}" var="top">
			    <tr>
			    	<td><c:out value="${top.title}"/></td>
			    	<td><c:out value="${top.userVO.nickname}"/></td>
			    </tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>