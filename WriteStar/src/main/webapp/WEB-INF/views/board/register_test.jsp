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
                            		<label>Title</label> <input class="form-control" name="title">
                            	</div>
                            	<div class="form-group">
                            		<label>Content</label> <textarea class="form-control" rows="3" name="content"></textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>Address</label> <input class="form-control" name="address">
                            	</div>
                            	<div class="form-group">
                            		<label>post_type</label> <input class="form-control" name="post_type">
                            	</div>
                            	<div class="form-group">
                            		<label>email</label> <input class="form-control" name="email">
                            	</div>
                            	
                            	<button type="submit" class="btn btn-default">등록</button>
                            	<button type="reset" class="btn btn-default">취소</button>
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
             	$()
             </script>
            
        
