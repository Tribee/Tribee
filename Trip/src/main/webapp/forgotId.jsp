<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
<title>forgotId</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>


function forgotId(frm) {
	frm.action = "forgotId.do";
	frm.submit();
}



<%-- ajax로 id를 찾아보자 (보류)
$(document).on('click','#findId',function(){
	var name = $('#name').val();
	var name = $('#email').val();
	
 	var postData = {'email' : email, 'name' : name};

	$.ajax({
        url:'/findingId',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var idLists = data.id;
        	var idLength = idLists.length
        	var idfind = idLists.substring(1, idLength-1)
       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+idfind+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});
--%>

</script>
</head>
<body class="container">
	<form method="post" style="width: 50%; margin: auto; margin-top: 120px;">
		<h4 style="text-align:center;">ID 찾기</h4>
		<br>
		<div class="form-group">
			<label for="exampleInputEmail1">이메일 주소</label>					
			<input type="email" class="form-control" name="email" value="${member.email }" placeholder="EMAIL"> 
		</div>
		<div class="form-group">
			<label for="exampleInputName">이름</label>
			<input type="text" class="form-control" name="name" value="${member.name }" placeholder="NAME"> 
		<br>
		</div>
		<div>
			<input type="button"class="btn btn-primary" value="ID 찾기" style="margin: auto;" onclick="forgotId(this.form)">
		</div>
	</form>
</body>
</html>