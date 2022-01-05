<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="/login" method='post' name="loginForm">
		<table>
			<tr>
				<td>
					<input type="email" id ="email" name="username" placeholder="이메일">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pw" name="password" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="로그인" onclick="return loginCheck()">
					<input type="hidden" id="" name="${_csrf.parameterName }" value="${_csrf.token }">
				</td>
			</tr>
		</table>
	</form>
	<script>
	function loginCheck(){	

		if(document.loginForm.email.value.length==0){
			alert("이메일을 입력하세요");
			document.loginForm.email.focus();
			return false;
		}
		if(document.loginForm.password.value.length==0){
			alert("비밀번호를 입력하세요");
			document.loginForm.password.focus();
			return false;
		}
	}
	</script>
</body>
</html>