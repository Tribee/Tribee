<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findPw</title>
</head>
<script>
	function findPw() {																																																																																																																																																											
		location = "main.jsp;"
		}
</script>
<body onload="findPw();">

	<%-- <h2>회원님의 비밀번호는 <input type = "text" pw = "memberpassword"> 입니다.</h2>--%>
	
	<script>
	
	var object = new Array();
	
	<c:forEach var = "list" items = "${list}">
		var id = "${list.id}";
		var email = "${list.email}";
		var name = "${list.name}";
		var password = "${list.password}";
		var temp = {"id" : id, "email" : email, "name" : name, "id" : id, "password" : password};
		object.push(temp);
	
	</c:forEach>
	console.log("id : "+"${id}");
	console.log("name : "+"${name}");
	console.log("email : "+ "${email}");
	console.log("========");
	console.log(object);
	console.log(object.length);
	for(var i = 0; i < object.length; i++){
		for(var j = 0; j < 4; j++){
			for(var k = 0; k < 4; k++){
			console.log(object[i]["id"] + " , " + object[i]["email"] + " , " + object[i]["name"]);
			if(object[i]["id"] == "${id}" && object[i]["email"] == "${email}" && object[i]["name"] == "${name}"){
				alert("회원님의 패스워드는: "+object[i]["password"] + "입니다.");
				document.getElementByPw("memberpassword").value = object[i]["password"];
				break;
				}
			}			
		}
	}
	
	</script>
	<h2><a href="main.jsp">메인 페이지로 이동</a></h2>
</body>
</html>