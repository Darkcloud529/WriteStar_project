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
	<div>
		<h1>친구 목록</h1>
		<table width="100%">
		    <thead>
		        <tr>
		            <th>email</th>
		            <th>nickname</th>
		            <th>user_info</th>
		            <th>button</th>
		        </tr>
		    </thead>
		    <c:forEach items="${friendList}" var="frList">
		    <tr>
		    	<td><c:out value="${frList.email}"/></td>
		    	<td><c:out value="${frList.nickname}"/></td>
		    	<td><c:out value="${frList.user_info}"/></td>
		    	<td>
		    		<button type="submit" id="delete">삭제</button>
		    	</td>
		    </tr>
		    </c:forEach>
		</table>
	</div>
</body>
</html>