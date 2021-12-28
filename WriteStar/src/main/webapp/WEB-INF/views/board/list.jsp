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

    <div id="content"> 
        <div id="nickname">  <!-- 사용자프로필 -->
            <%-- <img class="" src="${}"> --%> <!-- 사용자프로필사진가져오기 -->
              <h2><%-- <c:out value="${board.nickname}"/> --%></h2> <!-- 사용자닉네임가져오기 -->
            <div class="user_title">
              <h5><%-- <c:out value="${}"/> --%></h5> <!-- 사용자소개글가져오기 -->
              <div id="edit"><i class="fas fa-edit"></i></div> <!--클릭시 프로필 수정하기  -->
            </div>
            <div>
                <button id="new_star">새 별 쓰기</button> <!-- 게시글 작성하기 -->
                <button id="friend_request">친구요청하기</button> <!-- 친구요청하기 -->
            </div>
          </div>
      </div>
      <%-- 
       <section class="list"  class="clear">
       <ul id="gallery">
           <li class="img01">
             <div class="border"> <!-- 썸네일사진들어가는 -->
                     <h3 class="title"><c:out value="${board.title}"></c:out></h3><!-- 게시글제목 -->
                     <span class="title02"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>  <!-- 게시글 업데이트 날짜 -->
                     <br><c:out value="${board.email}"/></span> <!-- 사용자닉네임 -->
                     <span class="font01"><i class="fas fa-lock"></i></span> <!-- 비공개 -->

              </div>
           </li>
           <li class="img02">
            <div class="border">
            <a href="#">
                <!-- <img src="image/list02.png" alt="02"> -->
                 <h3 class="title"><c:out value="${board.title}"></c:out></h3><!-- 게시글제목 -->
                 <span class="title02"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>  <!-- 게시글 업데이트 날짜 -->
                 <br><c:out value="${board.email}"/></span> <!-- 사용자닉네임 -->
                  <span class="font02"><i class="fas fa-lock-open"></i></i></span>
            </a>
          </div>
          </li>
          <li class="img03">
            <div class="border">
            <a href="#">
                <!-- <img src="image/list03.png" alt="03"> -->
                  <h3 class="title"><c:out value="${board.title}"></c:out></h3><!-- 게시글제목 -->
                     <span class="title02"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/>  <!-- 게시글 업데이트 날짜 -->
                     <br><c:out value="${board.email}"/></span> <!-- 사용자닉네임 -->
                  <span class="font02"><i class="fas fa-lock-open"></i></i></span>
            </a>
          </div>
          </li>
          <li class="img04">
            <div class="border">
            <a href="#">
                <!-- <img src="image/list04.png" alt="04"> -->
                  <h3 class="title"><c:out value="${board.title}"></c:out></h3><!-- 게시글제목 -->
                     <span class="title02"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>  <!-- 게시글 업데이트 날짜 -->
                     <br><c:out value="${board.email}"/></span> <!-- 사용자닉네임 -->
                  <span class="font01"><i class="fas fa-lock"></i></span>
            </a>
          </div>
          </li>
          <li class="img05">
            <div class="border">
            <a href="#">
                <!-- <img src="image/list05.png" alt="05"> -->
                  <h3 class="title"><c:out value="${board.title}"></c:out></h3><!-- 게시글제목 -->
                     <span class="title02"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>  <!-- 게시글 업데이트 날짜 -->
                     <br><c:out value="${board.email}"/></span> <!-- 사용자닉네임 -->
                  <span class="font01"><i class="fas fa-lock"></i></span>
            </a>
          </div>
          </li>
          <li class="img06">
            <div class="border">
            <a href="#">
                <!-- <img src="image/list06.png" alt="06"> -->
                  <h3 class="title"><c:out value="${board.title}"></c:out></h3><!-- 게시글제목 -->
                     <span class="title02"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>  <!-- 게시글 업데이트 날짜 -->
                     <br><c:out value="${board.email}"/></span> <!-- 사용자닉네임 -->
                  <span class="font02"><i class="fas fa-lock-open"></i></i></span>
            </a>
          </div>
          </li>
       </ul>
    </section>
            --%>
       <c:forEach items="${list}" var="board">
         <ul>
           <div>
           <li><c:out value="${board.title}"></c:out></li> <!-- 게시글제목 -->
           <li><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></li> <!-- 게시글 업데이트 날짜 -->
           <li><c:out value="${board.email}"/></li> <!-- 사용자닉네임 -->
           <span class="font01"><i class="fas fa-lock"></i></span> <!-- 게시글 비공개 (아이콘) -->
           </div>
         </ul>
      
      </c:forEach>
           
</div>

<script>
		$("#new_star").on("click",function(){
			self.location="/board/register";
		});
		$("#friend_request").on("click",function(){
			self.location="";
		});
		
</script> 

</body>
</html>

        
 <%@include file="../includes/footer.jsp" %>   