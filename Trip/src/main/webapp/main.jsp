<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#container {
	width: 830px;
	margin: 80px auto 0 auto;
	background: #blue;
}

#container>div {
	float: left;
}

#left {
	width: 400px;
	heigth: 500px;
	background: #ccc;
	margin-right: 30px;
}

#right {
	width: 400px;
	height: 500px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

#right form {
	margin-top: 50px;
}

#right form input {
	width: 300px;
	margin: 0 0 20px 50px;
	height: 25px;
}

#right>div {
	width: 300px;
	margin: 20px 0 0 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
	function joinOk(frm) {

		if (!frm.id.value) {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}

		if (!frm.password.value) {
			alert("비밀번호를 입력하세요.");
			frm.password.focus();
			return false;
		}

		if (!frm.name.value) {
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}

		if (!frm.email.value) {
			alert("이메일을 입력하세요.");
			frm.email.focus();
			return false;
		}

		if (!frm.nick_name.value) {
			alert("닉네임을 입력하세요.");
			frm.nick_name.focus();
			return false;
		}

		frm.action = "insertMember.do";
		frm.submit();
	}

	function checkSpace(id) {
		if (id.search(/\s/) != -1) {
			return false;
		} else {
			return true;
		}
	}

	function checkSpecial(id) {
		var special = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		if (special.test(id) == true) {
			return false;
		} else {
			return true;
		}
	}
<%-- 에이작스로 아이디 중복 확인을 해보자 --%>
	function checkId() {
		var id = $('#id').val();

		var space = checkSpace(id);
		var special = checkSpecial(id);

		if (space == false) {
			$(chkMsg)
					.html(
							"<p style='COLOR: red' 'text-align:center'> 공백은 입력할 수 없습니다!!! </p>");
		} else if (special == false) {
			$(chkMsg)
					.html(
							"<p style='COLOR: red' 'text-align:center'> 특수문자는 입력할 수 없습니다!!! </p>");
		} else {

			$
					.ajax({
						url : 'idDuplChk.do',
						type : 'POST',
						data : {
							id : id
						},
						success : function(data) {
							if ($.trim(data) == 0) { //0:사용가능한 ID
								$('#chkMsg')
										.html(
												"<p style='COLOR: blue; text-align:center;'>사용가능한 ID입니다.</p>");
							} else { //이외:사용불가능한 ID
								$('#chkMsg')
										.html(
												"<p style='COLOR: red; text-align:center;'>이미 사용중인 ID입니다.</p>");
							}
						},
						error : function() {
							alert("에러입니다");
						}
					});
		}
	};
	function checkNick() {
		var nick_name = $('#nick_name').val();

		$
				.ajax({
					url : 'nickDuplChk.do',
					type : "POST",
					data : {
						nick_name : nick_name
					},
					success : function(data) {
						if ($.trim(data) == 0) {
							$('#chkMsg_nick')
									.html(
											"<p style='COLOR: blue; text-align:center;'>사용가능한 닉네임 입니다</p>");
						} else {
							$('#chkMsg_nick')
									.html(
											"<p style='COLOR: red; text-align:center;'>이미 사용중인 닉네임 입니다</p>");
						}
					},
					error : function() {
						alert("에러입니다");
					}
				});
	};
</script>



<!-- modal  -->
<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>
<!-- modal -->


<!-- 로그인 -->
<script>
	function login(frm) {
		frm.action = "login.do";
		frm.submit();
	}
</script>
<!-- 로그인 -->



</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<body>



	<div id="wrap">
		<div id="container">
			<div id="left">
				<!-- <img src="https://via.placeholder.com/400x500">-->
				<img
					src="https://cdn3.eyeem.com/thumb/42979e3c36635595143f5f7d2f511e6aff1b92a2-1471392224949/w/400">
			</div>

			<div id="right" style="overflow: auto;">
				<div style="margin-top: 8%">TRIBEE 에서 전세계에 있는 여행가들과 함께 이야기를
					나눠보세요.</div>

				<form method="POST">

					<!-- onKeyUp 부분 : 대문자 입력시 소문자로 자동 변환 -->

					<input class="form-control" type="text" id="id" name="id" oninput="checkId()" onKeyUp="this.value=this.value.toLowerCase();" placeholder="ID" /> 
					<span id="chkMsg"></span> 
					<input class="form-control" type="password" name="password" placeholder="PASSWORD"> 
					<input class="form-control" type="text" name="name" placeholder="NAME"> 
					<input class="form-control" type="email" name="email" placeholder="E-MAIL"> 
					<input class="form-control" type="text" id="nick_name" name="nick_name" oninput="checkNick()" placeholder="NICK NAME"> 
					<span id="chkMsg_nick"></span> 
					<input class="form-control" type="button" value="가입하기" onclick="joinOk(this.form)"> 
					<input class="form-control" type="hidden" name="joinchk" value="chk">

				</form>


				<div>가입시 TRIBEE 의 약관, 데이터 및 쿠키 정책에 동의하게 됩니다.</div>
				<div>
					계정이 있으신가요?
					<!-- Trigger the modal with a button -->
					<div style="display: inline">
						<button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>



<!-- MODAL -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
</head>
<body>

	<div class="container">

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Login
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" method="post">
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span>USER ID</label> <input
									type="text" name="id" value="${member.id }"
									class="form-control" id="id" placeholder="ID">
							</div>
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span>PASSWORD</label> <input
									type="password" name="password" value="${member.password }"
									class="form-control" id="password" placeholder="PASSWORD">
							</div>

							<!-- 
                  		 아이디 저장 일단은 주석처리 <div class="checkbox">
                        <label><input type="checkbox" value="" checked>Remember
                           me</label>
                     </div>
                     -->

							<button type="submit" class="btn btn-success btn-block"
								value="로그인" onclick="login(this.form)">
								<span class="glyphicon glyphicon-off"></span> Login
							</button>

						</form>



						<!-- 카카오 로그인 -->
						<a id="kakao-login-btn"></a> <a
							href="http://developers.kakao.com/logout"></a>


						<script type='text/javascript'>
							//<![CDATA[
							// 사용할 앱의 JavaScript 키를 설정해 주세요.
							Kakao.init('323838032ddd0be54be0df6581203660');
							// 카카오 로그인 버튼을 생성합니다.
							Kakao.Auth.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									<%--alert(JSON.stringify(authObj));--%>
									window.location.href="kakaologin.do";
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
							//]]>
						</script>



					</div>
					<div class="modal-footer">
						<!-- 
                  <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                     <span class="glyphicon glyphicon-remove"></span> Cancel
                  </button>
                -->
						<p>
							Forgot <a href="forgotId.jsp">ID </a> / <a href="forgotPw.jsp">Password</a>
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- MODAL -->






</body>
</html>
