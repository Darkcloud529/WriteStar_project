<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

 <div class="row">
     <div class="col-lg-12">
         <h1 class="page-header">Board</h1>
     </div>
     <!-- /.col-lg-12 -->
 </div>
 <!-- /.row -->
 <div class="row">
     <div class="col-lg-12">
         <div class="panel panel-default">
             <div class="panel-heading">
                 글수정
             </div>
             <!-- /.panel-heading -->
             <div class="panel-body">
                 <form role="form" action="/board/modify" method="post">
                 
                 
                 <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                 <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>

                            	
                        	<div class="form-group">
                        		<label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
                        	</div>
                        	<div class="form-group">
                        		<label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
                        	</div>
                        	<div class="form-group">
                        		<label>Content</label> <textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
                        	</div>
                        	<div class="form-group">
                        		<label>RegDate</label> <input class="form-control" name="redDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly>
                        	</div>
                        	<div class="form-group">
                        		<label>post_type</label> <input class="form-control" name="post_type" value='<c:out value="${board.post_type}"/>'readonly>
                        	</div>
                        	<div class="form-group">
                        		<label>Address</label> <input class="form-control" name="address" value='<c:out value="${board.address}"/>' readonly>
                        	</div>
                        </form>	
                      </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <script type="text/javascript">
            $(document).ready(function()){
            	var formObj = $("form");
            	
            	$('button').on("click", function(e){
            		e.preventDefault(e);
            		
            		var operation = $(this).date("oper");
            		
            		if(operation ==='remove'){
            			formObj.attr("action", "/board/remove");
            		}else if (operation==='list'){
            			//move to list
            			formObj.attr("action","/board/list").attr("method","get");
            			var pageNumTag = $("input[name='pageNum']").clone();
            			var amountTag = $("input[name='amount']").clone();
            			
            			formObj.empty();
            			fromObj.append(pageNumTag);
            			fromObj.append(amountTag);          			
            		}
            		formObj.submit();
            		
            	})
            }
            </script>	
            
                            	