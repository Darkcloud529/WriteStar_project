<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../includes/header.jsp" %>    

	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board</h1>
	    </div>
	</div>
	
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">
	                글목록
	                <button id="regBtn" type="button" class="btn btn-primary btn-xs pull-right">글등록</button>
	            </div>
	
	            <div class="panel-body">
	                <table width="100%" class="table table-striped table-bordered table-hover">
	                    <thead>
	                        <tr>
           						<th>#bno</th>
           						<th>title</th>
           						<th>email</th>
           						<th>content</th>
           						<th>regdate</th>
           						<th>post_type</th>
           						<th>address</th>
	                        </tr>
	                    </thead>
	                    <c:forEach items="${list}" var="board">
		                    <tr>
		                    	<td><c:out value="${board.bno}"/></td>
		                    	<td>
		                    		<a class='move' href='<c:out value="${board.bno}"/>'>
		                    			<c:out value="${board.title}"/>
		                    		</a>
		                    	</td>
		                    	<td><c:out value="${board.email}"/></td>
		                    	<td><c:out value="${board.content}"/></td>
		                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
		                    	<td><c:out value="${board.post_type}"/></td>
		                    	<td><c:out value="${board.address}"/></td>
		                    </tr>
	                    </c:forEach>
	                </table>
	                <!-- Paging -->
	                <div class="pull-right">
	                	<ul class="pagination">
	                	
	                		<c:if test="${pageMaker.prev}">
	                			<li class="paginate_button previous">
	                			<a href="${pageMaker.startPage -1 }">Previous</a>
	                			</li>
	                		</c:if>
	                		
	                		<c:forEach var="num" begin="${pageMaker.startPage }"
	                		end="${pageMaker.endPage }">
	                			<li class="paginate_button ${pageMaker.cri.pageNum == num ?"active":""} ">
	                			<a href="${num}">${num}</a>
	                			</li>
	                		</c:forEach>	
	                		
	                		<c:if test="${pageMaker.next }">
	                			<li class="paginate_button next">
	                			<a href="${pageMaker.endPage +1 }">Next</a>
	                			</li>
	                		</c:if>		
	                	</ul>
	                </div>
	                <form id='actionForm' action="/board/list" method="get">
	                	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	                	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	                </form>
	                <!-- Modal -->
	                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                                <h4 class="modal-title" id="myModalLabel">처리 완료</h4>
	                            </div>
	                            <div class="modal-body">
	                                처리가 완료되었습니다.
	                            </div>
	                            <div class="modal-footer">
	                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                            
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <script type="text/javascript">
	                	$(document).ready(function(){
	                		var result='<c:out value="${result}"/>';
	                		checkModal(result);
	                		
	                		history.replaceState({},null,null);		//history.state초기화
	                		
	                		function checkModal(result){  
	                			
	                			// 등록 후 목록으로 이동한 경우가 아니면 result값이 없으므로 중지
	                			// history.state값이 있는 경우도 중지
	                			if(result==='' || history.state){
	                				return;
	                			}
	                			if(parseInt(result)>0){
	                				$(".modal-body").html("게시글 "+parseInt(result)+"번이 등록되었습니다.");
	                			}
	                			// 모달창 보이게
	                			$("#myModal").modal("show"); 
	                		}
	                		// 글등록 버튼 클릭시 등록화면으로 이동
	            			$("#regBtn").on("click",function(){
	            				self.location="/board/register";
	            			});
	                		//페이지번호 클릭하면 이동
	                		var actionForm = $("#actionForm");
	                		
	                		$(".paginate_button a").on("click", function(e){
	                			e.preventDefault();
	                			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	                			actionForm.submit();
	                		});
	                	    $('.move').on("click", function(e){
	                	    	e.preventDefault();
	                	    	actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
	                	    	actionForm.attr("action", "/board/get");
	                	    	actionForm.submit();
	                	    });
	                	});
	                </script>	                
	            </div>
	        </div>
	    </div>
	</div>
        
 <%@include file="../includes/footer.jsp" %>   