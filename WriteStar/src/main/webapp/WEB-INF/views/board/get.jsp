<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@ include file="../includes/header.jsp" %> 
<c:out value="${login.email }"/>
<h1> ${login.nickname }</h1>   
			<style>
		.uploadResult {width: 100%;}				
		.uploadResult ul {float:left;}				
		.uploadResult ul li {}				
		.uploadResult ul li img {width: 260px; height: 260px; position:relative; border-radius: 20px;}
		.cancle_btn {width: 30px; height: 30px; background-color: #000; border-radius: 50%;}

		.bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center;
								top:0%; width:100%; height:100%; background-color: gray; z-index: 100;}				
		.bigPicture {position: relative; display:flex; justify-content: center; align-items: center;}
		.bigPicture img {width:600px;}
		
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
			<div id="board">
				<ul id="main">
					<li id="article_title_get"><input name="title" value='<c:out value="${board.title}"/>'readonly></li>
					<li id="article_date"><input name="redDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly></li>
					<li id="article_nickname">By <input name="email" value='<c:out value="${board.email}"/>' readonly></li>
					<li id="article_img">
						<div class='uploadResult'>
							<ul>
							</ul>
						</div>
						<div class='bigPictureWrapper'>
							  <div class='bigPicture'>
							  </div>
						</div>	
					</li>
					<li id="address">
						<input name="email" value='<c:out value="${board.address}"/>'readonly>
					</li>
					<li id="con_text">
						<textarea rows="5" name="content" readonly><c:out value="${board.content}"/></textarea>
					</li>
					<li id="board_btn">
						<button type="submit" data-oper="modify">수정하기</button>
						<button type="submit" data-oper="list">목록보기</button>
					</li>
				</ul>
				<!-- 댓글목록 ------------------------------------------------------------------------------------------------->
					<button id="addReplyBtn" class="chat">댓글쓰기</button>
					<ul id="reply">
						<li id="reply_title">다른 별에서 온 메세지<hr></li>
					</ul>
					<div class="panel-footer">
					</div>
				<!-- 댓글목록 -->
			</div>
		<form id="operForm" action="/board/modify" method="get">
					   <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
					   <%--<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					   <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					   <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
					   <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'> --%>
		</form>
	</div>
												
					<script type="text/javascript" src="/resources/js/reply.js"></script>
					
					<script type="text/javascript">
						$(document).ready(function(){
							$("#new_star").on("click",function(){
								self.location="/board/register";
							});
							var operForm=$("#operForm");
							$("button[data-oper='modify']").on("click",function(e){
								operForm.attr("action","/board/modify").submit();
							});
							$("button[data-oper='list']").on("click",function(e){
								operForm.find("#bno").remove();
								operForm.attr("action","/board/list");
								operForm.submit();
							});
							
							var bnoValue='<c:out value="${board.bno}"/>';
							var replyUL=$(".chat");//댓글목록이 출려되는 ul태그
							
							showList(1); 
							
							function showList(page){
								console.log("showList");
								replyService.getList({bno:bnoValue,page:page||1},function(replyCnt,list){
									console.log(list);
									
									//댓글등록후에는 마지막페이지로 이동
									if(page==-1){
										pageNum=Math.ceil(replyCnt/10.0);
										showList(pageNum);
										return;
									}
									
									var str="";
									if(list==null || list.length==0){
										replyUL.html("");
										return;
									}
									for(var i=0,len=list.length || 0; i<len; i++){
										str+="<li class='left clearfix' data-rno='"+list[i].rno+"' style='cursor:pointer'>";
										str+=" <div><div class='header'><strong>"+list[i].replyer+"</strong>";
										str+=" <small>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
										str+=" <p>"+list[i].reply+"</p></div></li>";
										
									}
									console.log(str);
									replyUL.html(str); //ul태그에 li태그 추가
									
								
								});
							} 
							
							var modal = $(".modal");
							var modalInputReply = modal.find("input[name='reply']");
							var modalInputReplyer = modal.find("input[name='replyer']");
							var modalInputReplyDate = modal.find("input[name='replyDate']");
							
							var modalModBtn = $("#modalModBtn");
							var modalRemoveBtn = $("#modalRemoveBtn");
							var modalRegisterBtn = $("#modalRegisterBtn");
							
							$("#addReplyBtn").on("click", function(e){                            	        
								modal.find("input").val("");
								modalInputReplyDate.closest("div").hide();
								modal.find("button[id !='modalCloseBtn']").hide();                            	        
								modalRegisterBtn.show();                            	        
								$(".modal").modal("show");                            	        
							  }); 

							$("#modalCloseBtn").on("click", function(e){                            	    	
								modal.modal('hide');
							}); 

						   modalRegisterBtn.on("click",function(e){                            	        
							  var reply = {
									reply: modalInputReply.val(),
									replyer:modalInputReplyer.val(),
									bno:bnoValue
								  };
							  replyService.add(reply, function(result){                             	          
								modal.find("input").val("");
								modal.modal("hide");
								
								//showList(1);
								showList(-1);//등록후 마지막페이지로 이동
							  });                            	        
							}); 
							  
							  $(".chat").on("click", "li", function(e){                            	          
								  var rno = $(this).data("rno");                            	          
								  replyService.get(rno, function(reply){                            	          
									modalInputReply.val(reply.reply);
									modalInputReplyer.val(reply.replyer);
									modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
									modal.data("rno", reply.rno);
									
									modal.find("button[id !='modalCloseBtn']").hide();
									modalModBtn.show();
									modalRemoveBtn.show();
									
									$(".modal").modal("show");
										
								  });
								}); 
							  
							  modalModBtn.on("click", function(e){
								  
								  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};                            	      
								  replyService.update(reply, function(result){
									modal.modal("hide");
									showList(pageNum);                            	        
								  });                            	      
								}); 

							  modalRemoveBtn.on("click", function (e){                            	    	  
									var rno = modal.data("rno");                            	  	  
									replyService.remove(rno, function(result){
										modal.modal("hide");
										showList(pageNum);                            	  	      
									});                            	  	  
								  });  
							   
							  var pageNum = 1;
							   var replyPageFooter = $(".panel-footer");
								
							   function showReplyPage(replyCnt){
								  
							   var endNum = Math.ceil(pageNum / 10.0) * 10;  
							   var startNum = endNum - 9; 
								  
							   var prev = startNum != 1;
							   var next = false;
								  
							   if(endNum * 10 >= replyCnt){
								 endNum = Math.ceil(replyCnt/10.0);
							   }
								  
							   if(endNum * 10 < replyCnt){
								 next = true;
							   } 
							       
							   var str = "<ul class='pagination pull-right'>";
								  
								 if(prev){
								   str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
								 }
								  
								 for(var i = startNum ; i <= endNum; i++){	                            	       
								   var active = pageNum == i? "active":"";
								  
								   str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
								 }
								  
								 if(next){
								   str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
								 }
								  
								 str += "</ul></div>";	                            	      
								  
								 replyPageFooter.html(str);
							   } 
							   
							   replyPageFooter.on("click","li a", function(e){
								   e.preventDefault();	                            	       
								   
								   var targetPageNum = $(this).attr("href");  
								   pageNum = targetPageNum;
								   
								   showList(pageNum);
							   });   
							   
							   /* 첨부파일 목록 ************************************************************************/
							   (function(){	                            		   
									var bno = '<c:out value="${board.bno}"/>';	                            		   
									$.getJSON("/board/getAttachList", {bno: bno}, function(arr){	                            		     
									   var str = "";	                            		       
									   $(arr).each(function(i, attach){	                            		       
										 //image type
										 if(attach.fileType){
										   var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
										   
										   str += "<li style='cursor:pointer' data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
										   str += "<img src='/display?fileName="+fileCallPath+"'>";
										   str += "</div>";
										   str +"</li>";
										 }else{	                            		             
										   str += "<li style='cursor:pointer' data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
										   str += "<span> "+ attach.fileName+"</span><br/>";
										   str += "<img src='/resources/img/attach.png'></a>";
										   str += "</div>";
										   str +"</li>";
										 }
									   });
									   
									   $(".uploadResult ul").html(str); 
									 });
								  })(); 
								/* 첨부파일 목록 */
							   
								/* 썸네일을 클릭했을 때 full screen으로 띄우기 *****************************************************************/
								   function showImage(fileCallPath){
									   $(".bigPictureWrapper").css("display","flex").show();
									   $(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'},1000);
								   } 
								   /* 썸네일을 클릭했을 때 full screen으로 띄우기 */
								   
								   $(".uploadResult").on("click","li",function(e){
									   var liObj=$(this);
									   var path=encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
									   if(liObj.data("type")){
										   showImage(path.replace(new RegExp(/\\/g),"/"));
									   }else{
										   self.location="/download?fileName="+path;
									   }
								   });
								   
								   $(".bigPictureWrapper").on("click",function(e){
									   $(".bigPicture").animate({width:'0%',height:'0%'},1000,function(){
										$(".bigPictureWrapper").hide();
									});		
								   });
							   
						});
					</script>
	
	<!-- Modal -------------------------------------------------------------------------------->
	<div class="modal">
		   <div class="modal-main">
			   <div class="modal-content">
				<div class="modal-body">
					<div class="form-group">
						<label>Replyer</label> 
						<input name='replyer'>
					</div>	
					<div class="form-group">
						<label>Reply</label> 
						<input name='reply'>
					</div>      		      
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button">Modify</button>
					<button id='modalRemoveBtn' type="button">Remove</button>
					<button id='modalRegisterBtn' type="button">Register</button>
					<button id='modalCloseBtn' type="button">Close</button>
				  </div>          
			  </div>				         
		   </div>					       
	  </div> 
	<!-- modal -->
            
            
        
 <%@include file="../includes/footer.jsp" %> 

