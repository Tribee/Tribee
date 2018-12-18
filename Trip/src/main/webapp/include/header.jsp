<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
		<div id="headerin">
			<div id="header_l">
				<div class="h_logo">
				 <h1><a href="#">TRIBEE</a></h1>
				</div>
				<div class="h_menu">
					<ul>
						<li><a href="#">FEED</a></li>
						<li><a href="#">RECENT</a></li>
						<li><a href="#">POPULAR</a></li>
					</ul>
				</div>
				<div class="h_search">
					<input type="search" placeholder="검색" name="search">
				</div>
			</div>
			<div id="header_r">
				<div class="user_img">
					<img src="./resources/image/60.png" alt="">
				</div>
				<div class="nick_name">
					<a href="myPage.do">${member.nick_name }</a>
				</div>
			</div>
		</div>
	</div><!-- header 끝 -->