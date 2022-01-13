<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

 <%@ include file="../includes/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구목록</title>
<style>
    .divider01 {margin:10px 0px; border:1px solid #ccc; width:100%; }
    .divider02 {margin:10px 0px; border:1px solid #ccc; width:100%; }
    td { line-height: 70px; text-align: center; margin:0 auto; font-size:15px; font-family: "NanumSquareRound"; font-style: normal;} 
 	h1 { font-weight: bolder; font-family: "NanumSquareRound"; font-style: normal; font-size:20px; margin-top:20px;}	
 	th {  font-weight: bolder; font-family: "NanumSquareRound"; font-style: normal;}
	img {width: 50px;  border-radius: 50%; }
    .approve {width:60px; height:30px;  background-color:#58798C; color: #fff; border-radius:25px; border:none; display:inline-block; cursor:pointer;
              font-size:15px;}
	.refuse {width:60px; height:30px; font-size:15px; background-color:#8F8F8F; color:#fff; border-radius:25px; border:none; display:inline-block; cursor:pointer; }
	.delete {width:60px; height:30px; font-size:15px; background-color:#2a2e33; color: #fff; border-radius:50px; border:none; cursor:pointer;display:inline-block;
	          margin:13px;} 
	.approve:hover { background-color:#1B3E50; color:#fff; }
	.refuse:hover { background-color:#808080; color:#fff; }
	#wrap {width:100%;} 
	#form tr:nth-child(even) {background-color:#F2F2F2;}
    #form2 tr:nth-child(even) {background-color:#F2F2F2;} 
    #form tr td {padding:20px; }
    #form2 tr td {padding:20px; }
    #form {margin-top:20px;}
    #innerwrap {margin-bottom:50px;}
</style>
</head>
<body>
	<div id="wrap">
	<div id="innerwrap">
		<h1>친구 요청 목록</h1>
		 <hr class="divider01">
		<form role="form" id="form" action="/friend/response" method="post">
			<table width="100%">
			    <thead>
			        <tr>
			            <th>프로필사진</th>
			            <th>이메일</th>
			            <th>닉네임</th>
			            <th>자기소개글</th>
			            
			        </tr>
			    </thead>
			    <c:forEach items="${list}" var="friend">
			    <tr>
			        <td><a href="/board/list?email=<c:out value="${friend.email}"/>"><img src="/resources/img/userPhoto.png" alt="#"></a></td>
			    	<td><a href="/board/list?email=<c:out value="${friend.email}"/>"><c:out value="${friend.email}"/></a></td>
			    	<td><a href="/board/list?email=<c:out value="${friend.email}"/>"><c:out value="${friend.nickname}"/></a></td>
			    	<td><a href="/board/list?email=<c:out value="${friend.email}"/>"><c:out value="${friend.user_info}"/></a></td>
			    	<td>
			    		<input  type="hidden" class="fromUser" name="from_user" value="<c:out value="${friend.email}"/>">
			    		<input  type="hidden" class="toUser"   name="to_user"   value="<c:out value="${login.email}"/>">
			    		<input  type="hidden" class="hdnInput" name="hdnYN"     value="S" >
			    		<button type="submit" class="approve"  value="Y" data-oper="Y">수락</button>
			    		<button type="submit" class="refuse"   value="N" data-oper="N">거절</button>
			    	</td>
			    </tr>
			    </c:forEach>
			</table>
		</form>
	</div>
	<div>
		<h1>친구 목록</h1>
		<hr class="divider02">
		<form role="form" id="form2" action="/friend/removeFriend" method="post">
			<table width="100%">
			    <thead>
			        <tr>
			            <th>프로필사진</th>
			            <th>이메일</th>
			            <th>닉네임</th>
			            <th>자기소개글</th>
			        </tr>
			    </thead>
			    <c:forEach items="${friendList}" var="frList">
				    <tr>
				        <td><a href="/board/list?email=<c:out value="${frList.email}"/>"><img src="/resources/img/userPhoto.png" alt="#"></a></td>
				    	<td><a href="/board/list?email=<c:out value="${frList.email}"/>"><c:out value="${frList.email}"/></a></td>
				    	<td><a href="/board/list?email=<c:out value="${frList.email}"/>"><c:out value="${frList.nickname}"/></a></td>
				    	<td><a href="/board/list?email=<c:out value="${frList.email}"/>"><c:out value="${frList.user_info}"/></a></td>
				    	<td>
				    		<input type="hidden"  class="friendEmail" name="friend_email" value="<c:out value="${frList.email}"/>">
				    		<input type="hidden"  class="userEmail"   name="user_email"   value="<c:out value="${login.email}"/>">
				    		<button type="submit" class="delete">삭제</button>
				    	</td>
				    </tr>
			    </c:forEach>
			</table>
		</form>
	</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		let appBtn = document.querySelector("#approve");
	    let refBtn = document.querySelector("#refuse");
	    
	    $(document).ready(function(){
	    	// 수락버튼을 클릭했을 때
	    	$(".approve").on("click",function(e){
	    		var operation = $(this).data("oper");
	    		$(this).parent("td").find(".hdnInput").val(operation);

	    		e.preventDefault();

	    		var fromUser = $(this).parent("td").find(".fromUser").clone();
	    		var toUser   = $(this).parent("td").find(".toUser").clone();
	    		var hdnYN    = $(this).parent("td").find(".hdnInput").clone();
	    		
				$("#form").empty();	
				
				$("#form").append(fromUser);
	    		$("#form").append(toUser);
	    		$("#form").append(hdnYN);
	    			    		
	    		$.ajax({
	                url : '/friend/response',
	                type : 'post',
	                data : {
	                	from_user : $("#form").find(".fromUser").val(),
	                	to_user : $("#form").find(".toUser").val(),
	                	hdnYN : $("#form").find(".hdnInput").val()
	                },
	                success : function(data){
	                    console.log("ajax approve success");
	                },
	                error: function(){
	                    console.log("ajax approve error");
	                }
	            });
	    	});
	    	
	    	// 거절버튼을 클릭했을 때
	    	$(".refuse").on("click",function(e){
	    		var operation = $(this).data("oper");
	    		$(this).parent("td").find(".hdnInput").val(operation);

	    		e.preventDefault();

	    		var fromUser = $(this).parent("td").find(".fromUser").clone();
	    		var toUser   = $(this).parent("td").find(".toUser").clone();
	    		var hdnYN    = $(this).parent("td").find(".hdnInput").clone();
	    		
				$("#form").empty();	
				
				$("#form").append(fromUser);
	    		$("#form").append(toUser);
	    		$("#form").append(hdnYN);
	    		
		    	var formData = $("#form").serialize();
	    		
	    		$.ajax({
	                url : '/friend/response',
	                type : 'post',
	                data : {
	                	from_user : $("#form").find(".fromUser").val(),
	                	to_user : $("#form").find(".toUser").val(),
	                	hdnYN : $("#form").find(".hdnInput").val()
	                },
	                success : function(data){
	                    console.log("ajax approve success");
	                },
	                error: function(){
	                    console.log("ajax approve error");
	                }
	            });
	    	});
	    	
	    	// 삭제버튼을 클릭했을 때
	    	$(".delete").on("click",function(e){
	    		e.preventDefault();
	    		
	    		var confirmResult = confirm("친구를 삭제하시겠습니까?");
	    		
	    		if (confirmResult == true) {
		    		var friendEmail = $(this).parent("td").find(".friendEmail").clone();
		    		var userEmail   = $(this).parent("td").find(".userEmail").clone();
		    		
		    		$("#form2").empty();

					$("#form2").append(friendEmail);
		    		$("#form2").append(userEmail);
		    		
		    		var formData = $("#form2").serialize();
		    		
		    		$.ajax({
		                url : '/friend/removeFriend',
		                type : 'post',
		                data : {
		                	friend_email : $("#form2").find(".friendEmail").val(),
		                	user_email : $("#form2").find(".userEmail").val()
		                },
		                success : function(data){
		                    console.log("ajax approve success");
		                },
		                error: function(){
		                    console.log("ajax approve error");
		                }
		            });
		    		
	    		} else {
	    			return false;
	    		}
	    		
	    	});
	    });
	</script>
</body>
</html>

<%@include file="../includes/footer.jsp" %> 