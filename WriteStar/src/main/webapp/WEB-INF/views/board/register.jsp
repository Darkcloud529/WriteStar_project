<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@ include file="../includes/header.jsp" %>    
			<style>
				.uploadResult {width: 100%; }				
		        .uploadResult ul {float:left;}				
		        .uploadResult ul li {}				
		        .uploadResult ul li img {width: 260px; height: 260px; position:relative; border-radius: 20px;}
		        .cancle_btn {width: 30px; height: 30px; background-color: #000; border-radius: 50%;}
		
		        .bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center;
		                             top:0%; width:100%; height:100%; background-color: gray; z-index: 100;}				
		        .bigPicture {position: relative; display:flex; justify-content: center; align-items: center;}
		        #new_star {display:none;}
		        #friend_request {display:none;}
			</style>
			
		    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
            
            <div id="wrapper">
		        <div id="profile">
		            <ul id="user">
		                <li id="user_photo">
		                    <img src="/resources/img/userPhoto.png" alt="#">
		                </li>
		                <li id="nickname">
		                    <h3>혼별혼별</h3>
		                </li>
		                <li id="user_info">
		                    <p>새벽에 잘 깨서 새벽에 별보기 좋아하는.... <br>
		                        혼자 별 보기 좋아하는.....
		                    </p>
		                </li>
		                <li id="modi_icon">
		                    <span class="iconify" data-icon="entypo:pencil"></span>
		                </li>
		                <li id="new_star">
		                    <button>새별쓰기</button>
		                </li>
		                <li id="friend_request">
		                    <button>친구 요청하기</button>
		                </li>
		            </ul>
		        </div>
		        <form role="form" action="/board/register" method="post">
		            
		            <div id="board">
		                <ul id="main">
		                    <li><h2>새 별 쓰기</h2></li>
		                    <li id="con_title">
		                        <input type="text" name="title" id="" placeholder="새로운 별 자리 제목을 입력하세요." >
		                    </li>
		                    <li id="email">
		                        <input type="text" name="email" id="" placeholder="사용자 이메일" >
		                    </li>
		                    <li id="con_text">
		                        <textarea name="content" id="" cols="30" rows="8" placeholder="내 별 자리에 대한 내용을 입력해 주세요."></textarea>
		                    </li>
		                    <li id="address">
		                        <input type="text" name="address" id="" placeholder="별을 본 곳의 주소를 입력해 주세요.">
		                    </li>
		                    <li id="attach_title">별 사진 첨부하기  <input type="file" name='uploadFile' multiple id="file_btn"></li>
		                    <li id="attach">
		                        <div class='uploadResult'>
		                        	<ul>
		                        	</ul>
		                        </div>
		                    </li>
		                    <li id="share_title">공개설정</li>
		                    <li id="share">
		                        <input type="radio" name="post_type" id="" value="1" checked="checked"> 전체공개  
		                        <input type="radio" name="post_type" id="" value="2"> 친구공개  
		                        <input type="radio" name="post_type" id="" value="3"> 비공개 
		                    </li>
		                    <li id="board_btn">
		                        <button type="submit">새 별 쓰기</button>
				                <button type="reset">다시 쓰기</button>
		                    </li>
		                </ul>
		            </div>
		        </form>
		    </div>
			
			
        
 <%@include file="../includes/footer.jsp" %>