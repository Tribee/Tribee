<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="./css/reset.css" rel="stylesheet" type="text/css">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function edit_go() {
	location.href = "userEdit.jsp";
}
</script>
</head>
<body>
<div id="wrap">
	<%@ include file="./include/header.jsp" %>
	
	<div id="container">	
		<div class="user_top cf">
			<div class="user_img">
				<img src="./resources/image/60.png" alt="${member.nick_name } 님의 프로필 이미지">
			</div>
			<div class="user_info">
				<div class="name_box cf">
					<div class="nick_name">${member.nick_name }</div>
					<div class="user_modify_btn">
						<input type="button" value="수정하기" name="user_modify" onclick="edit_go()">
					</div>
				</div>
				<div class="count_item_box cf">
					<div class="count_item">
						<span class="count_title">게시글</span>
						<span class="count_num">${boardCount }</span>
					</div>
					<div class="count_item">
						<span class="count_title">팔로워</span>
						<span class="count_num">0</span>
					</div>
					<div class="count_item">
						<span class="count_title">팔로우</span>
						<span class="count_num">0</span>
					</div>
				</div>
				<div class="introduce" title="${member.introduce }">${member.introduce }</div>
				<div class="address">${member.address }</div>
			</div>
		</div>
		<div class="user_feed cf">
			<c:if test="${ empty board }">
			<div class="empty_feed">
				게시글이 없습니다.
			</div>
			</c:if>
			<c:if test="${ not empty board }">
				<c:forEach var="b" items="${board }">
					<a class="user_feed_img">
						<img src="./resources/image/${b.bb_idx }.png" alt="${b.title }">
						<div class="user_feed_bg">${b.title }</div>
					</a>
				</c:forEach>
			</c:if>
		</div>
	</div><!-- container 끝 -->
	
	<%@ include file="./include/footer.jsp" %>
</div>
</body>
</html>