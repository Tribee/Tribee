<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findId</title>
</head>
<script>
	function findId() {																																																																																																																																																											
		location = "main.jsp;"
		}
</script>



<body onload="findId()">

	
<script>
	
	var object = new Array();
	
	<c:forEach var = "list" items = "${list}">
		var email = "${list.email}";
		var name = "${list.name}";
		var id = "${list.id}";
		var temp = {"email" : email , "name" : name, "id" : id};
		object.push(temp);
	
	</c:forEach>
	
	console.log("name : "+"${name}");
	console.log("email : "+ "${email}");
	console.log("========");
	console.log(object);
	console.log(object.length);
	for(var i = 0; i < object.length; i++){
		for(var j = 0; j < 3; j++){
			console.log(object[i]["email"] + " , " + object[i]["name"] );
			if(object[i]["email"] == "${email}" && o6bject[i]["name"] == "${name}"){
				alert("회원 ID : "+object[i]["id"]);
				document.getElementById("memberid").value = object[i]["id"];
				break;
			}
		}
	}
	
	
</script>
	
	
	
	  
</body>
</html>