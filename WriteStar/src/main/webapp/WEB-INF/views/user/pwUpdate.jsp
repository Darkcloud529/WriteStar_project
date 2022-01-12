<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../includes/header.jsp" %> 

	<div id="user_box">
		<form action="/user/pwUpdate" method="post" name="pwUpdateForm" role='form'>
		<table id="table_reg">
			<tr>
				<td>
					<input type="email" id="email_reg" name="email" placeholder="이메일" value="${login.email }" readonly>
                    <!-- <button type="button" id="emailCheckBtn" name="emailCheck" value="N">이메일 중복 확인</button> -->
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pw_update" name="password" placeholder="변경할 비밀번호를 입력해주세요." value="">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pw_check" name="passwordConfirm" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" id="registration" value="수정하기" onclick="return registerPwCheck()">
                    <button id="pwUpdateCancel" type="reset">취소</button>
				</td>
			</tr>
		</table>
		</form>
			<ul>
			
			</ul>
		</div>

	<script>
	function registerPwCheck(){ 
		// 각 입력칸 공란 확인
		
		if(document.pwUpdateForm.password.value.length==0){
			alert("비밀번호를 입력하세요");
			document.pwUpdateForm.password.focus();
			return false;
		}

	
	}
	</script>
	<script>

		
		
 		
	</script>
	
 <%@include file="../includes/footer.jsp" %>   