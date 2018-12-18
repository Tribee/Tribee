<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="./css/reset.css" rel="stylesheet" type="text/css">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function edit_go(frm) {
		if (frm.id.value == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}
		if (frm.nick_name.value == "") {
			alert("닉네임을 입력하세요.");
			frm.nick_name.focus();
			return false;
		}		
		if (frm.age.value == "") {
			alert("나이를 입력하세요.");
			frm.age.focus();
			return false;
		}		
		if (!(frm.age.value >= 1 && frm.age.value <= 150)) {
			alert("정확한 나이를 입력하세요.");
			frm.age.focus();
			return false;
		}
		
		var gender = document.getElementsByName("gender");
		var cnt = 0;
		for (var i=0; i<gender.length; i++) {
			if (gender[i].checked == true) cnt++;
		}		
		if (cnt < 1) {
			alert("성별을 선택해 주세요.");
			return false;
		}
		
		var isEditOk = confirm("정말 수정하시겠습니까?");
		if (isEditOk) {
			frm.action = "userEdit.do";
			frm.submit();
		}
		
	}
	
	function pass_go(frm) {
		var dbpw = "${member.password}";
		
		if(frm.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.password.focus();
			return false;
		}
		if(frm.password2.value == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.password2.focus();
			return false;
		}
		if(frm.password3.value == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.password3.focus();
			return false;
		}
		if (frm.password.value != dbpw) {
			alert("비밀번호가 틀렸습니다.");
			frm.password.focus();
			return false;
		}
		if (frm.password2.value != frm.password3.value) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.password2.focus();
			return false;
		}		
		if (frm.password2.value == frm.password3.value) {
			if (frm.password2.value == dbpw) {
				alert("이전 비밀번호와 다른 비밀번호를 입력해 주세요.");
				frm.password2.focus();
				return false;
			}
		}
		var isPassOk = confirm("정말 변경하시겠습니까?");
		if (isPassOk) {
			frm.action = "editPw.do";
			frm.submit();
		}
		
	}
	
	function del_go(frm) {
		var dbpw = "${member.password}";
		
		if(frm.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.password.focue();
			return false;
		}		
		if (frm.password.value != dbpw) {
			alert("비밀번호가 틀렸습니다.");
			frm.password.focus();
			return false;
		}
		
		var isDeleteOk = confirm("정말 계정을 삭제하시겠습니까?");
		if (isDeleteOk) {
			frm.action = "userDel.do";
			frm.submit();
		}
	}
	
	function openTab(evt, tabName) {
		  var i, tabContent, tablinks;

		  tabContent = document.getElementsByClassName("tabContent");
		  for (i = 0; i < tabContent.length; i++) {
		    tabContent[i].style.display = "none";
		  }

		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }

		  document.getElementById(tabName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
</script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
<div id="wrap">
	<%@ include file="./include/header.jsp" %>
	
	<div id="container">
		<div class="edit_wrap cf">
			<ul class="edit_tab">
				<li><a class="tablinks active" onclick="openTab(event, 'profile_edit')">프로필 편집</a></li>
				<li><a class="tablinks" onclick="openTab(event, 'password_edit')">비밀번호 수정</a></li>
				<li><a class="tablinks" onclick="openTab(event, 'delete_user')">계정 삭제</a></li>
			</ul>
			<div class="edit_box">
				<div id="profile_edit" class="tabContent">
					<form method="post">
						<div class="input_box">
							<div class="input_box_l">아이디</div>
							<div class="input_box_r">
								<input type="text" name="id" value="${member.id }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">이름</div>
							<div class="input_box_r">
								<input type="text" name="name" value="${member.name }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">닉네임</div>
							<div class="input_box_r">
								<input type="text" name="nick_name" value="${member.nick_name }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">거주지역</div>
							<div class="input_box_r">
								<input type="text" name="address" value="${member.address }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">직업</div>
							<div class="input_box_r">
								<input type="text" name="job" value="${member.job }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">성별</div>
							<div class="input_box_r">
								<c:if test="${member.gender eq null}">								
									<input type="radio" name="gender" value="M"> 남성
									<input type="radio" name="gender" value="F"> 여성
								</c:if>
								<c:if test="${member.gender eq 'M'}">								
									<input type="radio" name="gender" value="M" checked> 남성
									<input type="radio" name="gender" value="F"> 여성
								</c:if>
								<c:if test="${member.gender eq 'F' }">								
									<input type="radio" name="gender" value="M"> 남성
									<input type="radio" name="gender" value="F"  checked> 여성
								</c:if>
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">나이</div>
							<div class="input_box_r">								
								<input type="number" name="age" value="${member.age }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">가고싶은 곳</div>
							<div class="input_box_r">
								<input type="text" name="utopia" value="${member.utopia }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">이메일 주소</div>
							<div class="input_box_r">
								<input type="text" name="email" value="${member.email }">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">자기소개</div>
							<div class="input_box_r">
								<textarea name="introduce">${member.introduce }</textarea>
							</div>
						</div>
						
						<div class="btn_box">
							<input type="button" value="수정하기" onclick="edit_go(this.form)">
						</div>
					</form>
				</div>
				<div id="password_edit" class="tabContent" style="display: none;">
					<form method="post">
						<div class="input_box">
							<div class="input_box_l">이전 비밀번호</div>
							<div class="input_box_r">
									<input type="password" name="password">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">새 비밀번호</div>
							<div class="input_box_r">
									<input type="password" name="password2">
							</div>
						</div>
						<div class="input_box">
							<div class="input_box_l">비밀번호 확인</div>
							<div class="input_box_r">
									<input type="password" name="password3">
							</div>
						</div>
						<div class="btn_box">
								<input type="button" value="변경하기" onclick="pass_go(this.form)">
						</div>
					</form>
				</div>
				<div id="delete_user" class="tabContent" style="display: none;">
					<div class="delete_txt du1">
						${member.nick_name }님, 안녕하세요!<br>계정을 삭제하려고 하신다니 아쉽습니다.
					</div>
					<div class="delete_txt du2">
						계정을 삭제 하시려면 비밀번호를 입력하세요.
					</div>
					<form method="post">
						<div class="input_box">
							<div class="input_box_l">비밀번호</div>
							<div class="input_box_r">
									<input type="password" name="password">
							</div>
							<div class="btn_box">
								<input type="button" value="삭제하기" onclick="del_go(this.form)">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!-- container 끝 -->
	
	<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>