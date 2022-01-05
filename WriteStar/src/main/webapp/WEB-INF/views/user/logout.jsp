<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form role="form" method='post' action='/logout'>
		<fieldset>
			<a href="index.html" id="logout">로그아웃</a>
		</fieldset>
		<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>
	<script>
	$("#logout").on("click", function(e){
		e.preventDefault();
		$("form").submit();
	});
	</script>
	<c:if test="${param.logout != null }">
		<script>
			$(document).ready(function(){
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>
</body>
</html>