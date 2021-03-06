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
				<button type="button" id="emailCheckBtn" name="emailCheck" value="N">이메일 중복 확인</button>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" id="password" name="password" placeholder="비밀번호">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호 확인">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="nickname" name="nickname" placeholder="닉네임">
			</td>
			<td>
				<button type="button" id="nicknameCheckBtn" name="nicknameCheck" value="N">닉네임 중복 확인</button>
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
		// 각 입력칸 공란 확인
		if(document.registerForm.email.value.length==0){ 		// 이메일을 입력하지 않았다면 ~
			alert("이메일을 입력하세요"); 							// 경고창 
			document.registerForm.email.focus(); 				// 이메일 입력칸에 커서 이동
			return false; 										// 실행 중지 
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
		
		// 중복 확인 유무 
		if(document.registerForm.emailCheck.value == 'N'){		// 중복 확인을 안했다면 ~
			alert("이메일 중복 확인을 하세요."); 						// 경고창
			return false;
		}
		
		var password = $("#password").val();
		// 최소 8자 최소 하나의 문자, 하나의 숫자 및 하나의 특수문자
		var regPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		if(!regPassword.test(password)) {
			alert("비밀번호 양식이 올바르지 않습니다.");
			document.registerForm.password.focus();
			return false;
		}
		// 비밀번호 일치 확인
		var passwordConfirm  = $("#passwordConfirm").val();
		if(password != passwordConfirm) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			document.registerForm.password.focus();
			return false;
		}
		
		if(document.registerForm.nicknameCheck.value == 'N'){
			alert("닉네임 중복 확인을 하세요.");
			return false;
		}
		
	}
	</script>
	<script>
	$(document).ready(function(){
		// 이메일 중복 확인 버튼 클릭 시 
		$('#emailCheckBtn').click(function(){
			
			// 이메일 입력란 공백 확인
			var email = $("#email").val();						// 입력한 이메일 값
			if(email.length == 0) {								// 이메일을 입력하지 않았다면
				alert("이메일을 입력하세요");						// 경고창
				$("#email").focus();							// 커서 이동
				return false;									// 실행 중지
				}
			
			// 이메일 정규표현식 확인
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!regEmail.test(email)) {
				alert("이메일 입력이 올바르지 않습니다.");
				$("#email").focus();							
				return false;
			}
			
			// 이메일 중복 확인
			$.ajax({
				url : "/user/emailCheck",						// 전송 페이지(action url)
				type : "post",									// 전송 방식(get or post)
				dataType : "json",								// 요청한 데이터 형식 (html,xml,json,text,jsonp)
				data : {"email" : $("#email").val()},			// 전송할 데이터
				success : function(data){						// 전송에 성공하면 실행할 코드
					if(data == 1) {								// 중복되었다면 ~
						alert("중복된 아이디입니다.");				// 중복 경고창
					} else if(data == 0) {						// 중복되지 않았다면 ~
						$("#emailCheckBtn").attr('value','Y');	// 중복 확인 표시
						alert("사용가능한 아이디입니다.");				// 사용 가능 경고창
					}
				}
			})
		});
		
		// 닉네임 중복 확인 버튼 클릭 시 
		$('#nicknameCheckBtn').click(function(){
			
			// 닉네임 공백 확인
			var nickname = $("#nickname").val();
			if(nickname.length == 0) {
				alert("닉네임을 입력하세요");
				$("#nickname").focus();
				return false;
				}
			
			// 닉네임 중복 확인
			$.ajax({
				url : "/user/nicknameCheck",
				type : "post",
				dataType : "json",
				data : {"nickname" : $("#nickname").val()},
				success : function(data){
					if(data == 1) {
						alert("중복된 닉네임입니다.");
					} else if(data == 0) {
						$("#nicknameCheckBtn").attr('value','Y');
						alert("사용가능한 닉네임입니다.");
					}
				}
			})
		});
	});
	</script>
</body>
</html>