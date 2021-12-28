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
                            글등록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form role="form" action="/board/register" method="post">
                                <div class="form-group">
                            		<label>bno</label> <input class="form-control" name="bno"
                            		value='<c:out value="${board.bno }"/>' readonly="readonly">
                            	</div>
                            	<div class="form-group">
                            		<label>Title</label> <input class="form-control" name="title"
                            		value='<c:out value="${board.title }"/>' readonly="readonly">
                            	</div>
                            	<div class="form-group">
                            		<label>Content</label> <textarea class="form-control" rows="3" name="content" readonly>
                            			<c:out value="${board.content }"/>
                            		</textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>Address</label> <input class="form-control" name="address"
                            		value='<c:out value="${board.address }"/>' readonly="readonly">
                                    
                            	</div>
                            	<div class="form-group">
                            		<label>post_type</label> <input class="form-control" name="post_type"
                            		value='<c:out value="${board.post_type }"/>' readonly="readonly">
                            		
                            	</div>
                            	<div class="form-group">
                            		<label>email</label> <input class="form-control" name="email"
                            		value='<c:out value="${board.email }"/>' readonly="readonly">
                            	</div>
                            	
                            	<button data-oper="modify" class="btn btn-default"
                            	onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">modify</button>
                            	<button data-oper="list" class="btn btn-info"
                            	onclick="location.href='/board/list'">list</button>
                            </form>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
        
