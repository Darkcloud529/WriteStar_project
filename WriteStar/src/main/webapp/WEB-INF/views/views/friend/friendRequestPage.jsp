<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구목록</title>
<style>
	td { text-align: center; }
	#approve { width: 100px; border: 1px solid blue; color: blue; }
	#refuse { width: 100px; border: 1px solid red; color: red; }
	#approve:hover { background-color: blue; color: white; }
	#refuse:hover { background-color: red; color: white; }
</style>
</head>
<body>
	<div>
		<h1>친구 요청 목록</h1>
		<form role="form" id="form" action="/friend/response" method="post">
			<table width="100%">
			    <thead>
			        <tr>
			            <th>email</th>
			            <th>nickname</th>
			            <th>user_info</th>
			            <th>button</th>
			        </tr>
			    </thead>
			    <c:forEach items="${list}" var="friend">
			    <tr>
			    	<td><c:out value="${friend.email}"/></td>
			    	<td><c:out value="${friend.nickname}"/></td>
			    	<td><c:out value="${friend.user_info}"/></td>
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
	<hr>
	<div>
		<h1>친구 목록</h1>
		<form role="form" id="form2" action="/friend/removeFriend" method="post">
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
				    		<input type="hidden"  class="friendEmail" name="friend_email" value="<c:out value="${frList.email}"/>">
				    		<input type="hidden"  class="userEmail"   name="user_email"   value="<c:out value="${login.email}"/>">
				    		<button type="submit" class="delete">삭제</button>
				    	</td>
				    </tr>
			    </c:forEach>
			</table>
		</form>
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