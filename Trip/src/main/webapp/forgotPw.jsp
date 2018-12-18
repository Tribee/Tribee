<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forgotPw</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function forgotPw(frm) {
	frm.action = "forgotPw.do";
	frm.submit();
}
</script>
</head>
<body class="container">
	<form method="post" style="width: 50%; margin: auto; margin-top: 120px;">
		<h4 style="text-align:center;">PW 찾기</h4>
		<br>
		<div class="form-group">
			<label for="exampleInputId">ID</label>					
			<input type="text" class="form-control" name="id" value="${member.id }" placeholder="ID"> 
		</div>
		<div class="form-group">
			<label for="exampleInputName">이름</label>
			<input type="text" class="form-control" name="name" value="${member.name }" placeholder="NAME">
		</div> 
		<div class="form-group">
			<label for="exampleInputEmail1">이메일 주소</label>					
			<input type="email" class="form-control" name="email" value="${member.email }" placeholder="EMAIL"> 
		</div>
		<br>
		</div>
		<div>
			<input type="button" class="btn btn-primary" value="PW 찾기" style="margin: auto;" onclick="forgotPw(this.form)">
		</div>
	</form>		
</body>
</html>