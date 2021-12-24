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
			    		<input  type="hidden" name="from_user" value="<c:out value="${friend.email}"/>">
			    		<input  type="hidden" name="nickname"  value="<c:out value="${friend.nickname}"/>">
			    		<input  type="hidden" name="to_user"   value="yujin@test.com">
			    		<input  type="hidden" id="hdnInput" value="S" name="hdnYN">
			    		<button type="submit" id="approve"  value="Y" data-oper="Y">수락</button>
			    		<button type="submit" id="refuse"   value="N" data-oper="N">거절</button>
			    	</td>
			    </tr>
			    </c:forEach>
			</table>
		</form>
	</div>
	<hr>
	<%-- <%@ include file="./friendListPage.jsp" %> --%>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		let appBtn = document.querySelector("#approve");
	    let refBtn = document.querySelector("#refuse");
	    
	    $(document).ready(function(){
	    	// 수락버튼을 클릭했을 때
	    	$("#approve").on("click",function(e){
	    		var operation = $(this).data("oper");
	    		$(this).parent("td").find("#hdnInput").val(operation);

	    		e.prventDefault();
	    		
		    	var formData = $("#form").serialize();
		    	
	    		$.ajax({
	                url : '/friend/response',
	                type : 'post',
	                data : {
	                	formData
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
	    	$("#refuse").on("click",function(e){
	    		var operation = $(this).data("oper");
	    		$(this).parent("td").find("#hdnInput").val(operation);

	    		e.prventDefault();
	    		
		    	var formData = $("#form").serialize();
	    		
	    		$.ajax({
	                url : '/friend/response',
	                type : 'post',
	                data : {
	                	formData
	                },
	                success : function(data){
	                    console.log("ajax approve success");
	                },
	                error: function(){
	                    console.log("ajax approve error");
	                }
	            });
	    	});
	    });
	</script>
</body>
</html>