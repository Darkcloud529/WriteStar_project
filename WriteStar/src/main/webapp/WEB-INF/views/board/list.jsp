<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
 
 <%@ include file="../includes/header.jsp" %> 
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link rel="stylesheet" href="list.css">
    <title>목록리스트</title>
</head>
<body>
<div id="wrap">
	<div id="content" class="clear">
		<aside>
			<div id="nickname" >
            	<img src="/resources/img/userPhoto.png" alt="">
            	<h4>혼별혼별</h4>
            	<div id="user_info">
              		<p>새벽에 잘 깨서 새벽에 별보기 좋아하는....<br>
                		혼자 별보기 좋아하는............</p>
              	</div>
              	
          		<div id="edit"><i class="fas fa-edit"></i></div>
          		
				<div id="button">
	          		<div>
	            		<button class="new_star">새 별 쓰기</button>
	          		</div>
	          		<div>
	            		<button class="friend_request">친구요청하기</button>
	          		</div>
				</div>
			</div>
		</aside>
        
    <c:forEach items="${list}" var="board" begin="0" end="1">
		<ul id="gallery01">
			<li>
				<div class="border">
           		</div>
            <div id="picter_01">
              <p class="title"><c:out value="${board.title}"></c:out></p>
              <p class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></p>
              <p class="nickname"><c:out value="${board.userVO.nickname}"/></p>
            </div>
              <span class="font01"><i class="fas fa-lock-open"></i></i></span>
          	</li>
      	  	<li>
            	<div class="border">
           		</div>
	            <div id="picter_02">
	              <p class="title"><c:out value="${board.title}"></c:out></p>
	              <p class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></p>
	              <p class="nickname"><c:out value="${board.userVO.nickname}"/></p>
	            </div>
              	<span class="font02"><i class="fas fa-lock-open"></i></i></span>        
          	</li>
          	<li>
	            <div class="border">
	           	</div>
	            <div id="picter_03">
	              <p class="title"><c:out value="${board.title}"></c:out></p>
	              <p class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></p>
	              <p class="nickname"><c:out value="${board.userVO.nickname}"/></p>
	            </div>
              <span class="font03"><i class="fas fa-lock-open"></i></i></span>
          </li> 
        </ul>
	</c:forEach>
	
	<script>
		$(".new_star").on("click",function(){
			self.location="/board/register";
		});
		$(".friend_request").on("click",function(){
			self.location="";
		});
		
		$("#edit").on("click",function(){
            
		});
	</script>

</body>
</html>
        
 <%@include file="../includes/footer.jsp" %>   