<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
</head>
	
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
                            		<lable>Title</lable> <input class="form-control" name="title">
                            	</div>
                            	<div class="form-group">
                            		<lable>Content</lable> <textarea class="form-control" rows="3" name="content"></textarea>
                            	</div>
                            	<div class="form-group">
                            		<lable>Writer</lable> <input class="form-control" name="writer">
                            	</div>
                            	
                            	<!-- 첨부파일업로드 ------------------------------------------------------------>
	                            <div class="row">
								  <div class="col-lg-12">
								    <div class="panel panel-default">							
								      <div class="panel-heading">File Attach</div>
								      
								      <div class="panel-body">
								        <div class="form-group uploadDiv">
								            <input type="file" name='uploadFile' multiple>
								        </div>
								        
								        <div class='uploadResult'> 
								          <ul>
								          
								          </ul>
								        </div>
								      </div>							
								    </div>
								  </div>
								</div>
	                            <!-- 첨부파일업로드 -->
                            	
                            	
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
            
            <script>
            	$(document).ready(function(){            		 
            		  var formObj = $("form[role='form']");            		  
            		  $("button[type='submit']").on("click", function(e){            		    
            		    e.preventDefault();  //전송을 막는다  
            		    var str="";
            		    //첨부파일미리보기 데이터를 사용해서 form태그에 hidden태그를 추가한 후 전송
            		    $(".uploadResult ul li").each(function(i,obj){
            		    	var jobj=$(obj);
            		    	str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
            		    	str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
            		    	str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
            		    	str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
            		    });
            		    formObj.append(str).submit();
            		   		    
            		  }); 
            		
            		  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            		  var maxSize = 5242880; //5MB
            		  
            		  function checkExtension(fileName, fileSize){            		    
            		    if(fileSize >= maxSize){
            		      alert("파일 사이즈 초과");
            		      return false;
            		    }
            		    
            		    if(regex.test(fileName)){
            		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
            		      return false;
            		    }
            		    return true;
            		  }
            		  
            		  $("input[type='file']").change(function(e){
            		    var formData = new FormData();            		    
            		    var inputFile = $("input[name='uploadFile']");            		    
            		    var files = inputFile[0].files;
            		    
            		    for(var i = 0; i < files.length; i++){
            		      if(!checkExtension(files[i].name, files[i].size) ){
            		        return false;
            		      }
            		      formData.append("uploadFile", files[i]);            		      
            		    }
            		    
            		    $.ajax({
            		      url: '/uploadAjaxAction',
            		      processData: false, 
            		      contentType: false,
            		      data: formData,
            		      type: 'POST',
            		      dataType:'json',
            		      success: function(result){            		         
            			    showUploadResult(result); 
            		      }
            		    });            		    
            		  });
            		  
            		  function showUploadResult(uploadResultArr){
            			    //업로드파일이 없으면 중지
            			    if(!uploadResultArr || uploadResultArr.length == 0){ 
            			    	return; 
            			    }            			    
            			    
            			    var uploadUL = $(".uploadResult ul");            			    
            			    var str ="";
            			    
            			    $(uploadResultArr).each(function(i, obj){            			    
            			        //이미지이면 썸네일을 보여준다.
            			        if(obj.image){
            			          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
            			          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
            			          str += "<span> "+ obj.fileName+"</span>";
            			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            			          str += "<img src='/display?fileName="+fileCallPath+"'>";
            			          str += "</div>";
            			          str +"</li>";
            			        }else{//파일이면 파일명과 attach.png를 보여준다
            			          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
            			          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
            			              
            			          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
            			          str += "<span> "+ obj.fileName+"</span>";
            			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            			          str += "<img src='/resources/img/attach.png'></a>";
            			          str += "</div>";
            			          str +"</li>";
            			        } 

            			    });
            			    
            			    uploadUL.append(str);
            			  }
            		  
            			// 'x' 아이콘 클릭시 삭제 이벤트 처리
            		  $(".uploadResult").on("click", "button", function(e){             			      
            			    var targetFile = $(this).data("file");
            			    var type = $(this).data("type");
            			    
            			    var targetLi = $(this).closest("li");
            			    
            			    $.ajax({
            			      url: '/deleteFile',
            			      data: {fileName: targetFile, type:type},
            			      dataType:'text',
            			      type: 'POST',
            			        success: function(result){
            			           alert(result);            			           
            			           targetLi.remove();
            			         }
            			    });
            			   });
            	});
            </script>
            
        
