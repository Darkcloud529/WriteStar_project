<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h1>회원 가입 페이지</h1>
	<form action="/user/register" method="post" name="registerForm">
	<table>
		<tr>
			<td>
				<input type="email" id="email" name="email" placeholder="이메일">
			</td>
			<td>
				<button id="emailCheckBtn" type="button">이메일 중복 확인</button>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="password" placeholder="비밀번호">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="passwordConfirm" placeholder="비밀번호 확인">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="nickname" placeholder="닉네임">
			</td>
			<td>
				<button type="button" id="nicknameCheckBtn">닉네임 중복 확인</button>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="가입" onclick="return registerCheck()">
			</td>
		</tr>
	</table>
	</form>
	<script>
	function registerCheck(){	

		if(document.registerForm.email.value.length==0){
			alert("이메일을 입력하세요");
			document.registerForm.email.focus();
			return false;
		}
		if(document.registerForm.password.value.length==0){
			alert("비밀번호를 입력하세요");
			document.registerForm.password.focus();
			return false;
		}
		if(document.registerForm.nickname.value.length==0){
			alert("닉네임을 입력하세요");
			document.reigsterForm.nickname.focus();
			return false;
		}
	}
	</script>
	<script>
	$(document).ready(function(){
		$('#emailCheckBtn').click(function(){
			$.ajax({
				url : "/user/emailCheck",
				type : "post",
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data){
					if(data == 1) {
						alert("중복된 아이디입니다.");
					} else if(data == 0) {
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		});
	});
	</script>
</body>
</html>