<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../includes/header.jsp" %> 

	<div id="user_box">
		<form action="/user/userUpdate" method="post" name="userUpdateForm" role='form'>
		<table id="table_reg">
			<tr>
				<td>
					<input type="email" id="email_reg" name="email" placeholder="이메일" value="${login.email }" readonly>
                    <!-- <button type="button" id="emailCheckBtn" name="emailCheck" value="N">이메일 중복 확인</button> -->
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="nickname_reg" name="nickname" placeholder="닉네임">
                    <button type="button" id="nicknameCheckBtn" name="nicknameCheck" value="N">닉네임 중복 확인</button>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="pw_check" name="user_info" placeholder="간단한 소개글을 입력해 주세요.">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" id="registration" value="수정하기" onclick="return registerCheck()">
                    <button>취소</button>
                    <button type="button" onclick="location.href='/user/pwUpdate'">비밀번호변경</button>
				</td>
			</tr>
		</table>
		</form>
		
		<input type="file" id="file_btn" name='uploadFile' multiple>
		<div id="image">
			<ul>
			
			</ul>
		</div>
	</div>
	<script>
	function registerCheck(){ 
		// 각 입력칸 공란 확인
		
		if(document.registerForm.nickname.value.length==0){
			alert("닉네임을 입력하세요");
			document.reigsterForm.nickname.focus();
			return false;
		}
		
		if(document.registerForm.nicknameCheck.value == 'N'){
			alert("닉네임 중복 확인을 하세요.");
			return false;
		}
		
	}
	</script>
	<script>
	$(document).ready(function(){
		// 닉네임 중복 확인 버튼 클릭 시 
		$('#nicknameCheckBtn').click(function(){
			
			// 닉네임 공백 확인
			var nickname = $("#nickname_reg").val();
			if(nickname.length == 0) {
				alert("닉네임을 입력하세요");
				$("#nickname_reg").focus();
				return false;
				}
			
			// 닉네임 중복 확인
			$.ajax({
				url : "/user/nicknameCheck",
				type : "post",
				dataType : "json",
				data : {"nickname" : $("#nickname_reg").val()},
				success : function(data){
					if(data == 1) {
						alert("중복된 닉네임입니다.");
					} else if(data == 0) {
						$("#nicknameCheckBtn").attr('value','Y');
						alert("사용가능한 닉네임입니다.");
					}
				}
			})
		});
		
 		var formObj = $("form[role='form']");            		  
 	    $("input[type='submit']").on("click", function(e){            		    
 		    e.preventDefault();  //전송을 막는다
 		   
 		    var str="";
 		    //첨부파일미리보기 데이터를 사용해서 form태그에 hidden태그를 추가한 후 전송
 		    $("#image ul li").each(function(i,obj){
 		    	var jobj=$(obj);
 	
 		    	str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
 		    	str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
 		    	str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
 		    	str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
 		    });
 		    formObj.append(str).submit();	    
 		  }); 
		  
		  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 파일 정규표현식
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
		  
		  // 파일 업로드 
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
		    	console.log(result);           		    	
			    showUploadResult(result); 
		      }
		    });            		    
		  });
		  
		  // 업로드 결과를 화면에 섬네일로 표시
		  function showUploadResult(uploadResultArr){
			    //업로드파일이 없으면 중지
			    if(!uploadResultArr || uploadResultArr.length == 0){ 
			    	return; 
			    }            			    
			    
			    var uploadUL = $("#image ul");            			    
			    var str ="";
			    
			    $(uploadResultArr).each(function(i, obj){            			    
			        //이미지이면 썸네일을 보여준다.
			        if(obj.image){
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
			          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='cancle_btn'>x</button>";
			          str += "<img src='/display?fileName="+fileCallPath+"'>";
			          str += "</div>";
			          str +"</li>";
			        }else{
			          //파일이면 파일명과 attach.png를 보여준다
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
			          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			              
			          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='cancle_btn'>x</button>";
			          str += "<img src='/resources/img/attach.png'></a>";
			          str += "</div>";
			          str +"</li>"; 
			        } 
			    });
			    uploadUL.append(str);
			  }
		  
			// 'x' 아이콘 클릭시 삭제 이벤트 처리
		  $("#image").on("click", "button", function(e){             			      
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
	
 <%@include file="../includes/footer.jsp" %>   