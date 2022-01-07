var replyService=(function(){
	function add(reply,callback,error){
		$.ajax({
			type: "post",
			url: "/replies/new",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result,status,xhr){
				//callback함수가 parameter로 전달되면
				if(callback){
					callback(result); //callback함수 호출
				}
			},
			error: function(xhr,status,er){
				//error함수가 parameter로 전달되면
				if(error){
					error(er); //error함수 호출. 
				}
			}
		});
	
	}
	function getList(param,callback,error){
		var bno=param.bno; //부모글번호
		var page= param.page || 1; //param.page 값이 있으면 page에 param.page저장. 없으면 1을 저장
		$.getJSON("/replies/pages/" +bno+"/"+page+".json",
			function(data){
				if(callback){
				callback(data.replyCnt, data.list);
				}
			}
		).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}	
	function remove(rno,callback,error){
		$.ajax({
			type: "delete",
			url: "/replies/"+rno,
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error: function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}
	function update(reply,callback,error){
		$.ajax({
			type: "put",
			url: "/replies/"+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result,status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	
	}
	function get(rno,callback,error){
		$.get("/replies/"+rno+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	return {add:add, remove:remove, getList:getList, update:update, get:get, displayTime:displayTime};
})();