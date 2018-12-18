<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua" rel="stylesheet">

<style>
	* {
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	}
	body {
	    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #333;
	    background-color: #fff;
	}
	.navbar-brand{
		font-size: 2em;
	}
	.container-fluid{
		margin-top: 80px;
	}
	.sidebar {
	    position: fixed;
	    top: 50px;
	    bottom: 0;
	    left: 0;
	    padding: 10px;
	    overflow-x: hidden;
	    overflow-y: auto;
	    background-color: #242424;
	}
	.nav-sidebar{
		padding-top: 20px;
	}
	.nav-sidebar li{
		font-size: 1em;
		line-height: 2.2em;
	}
	.nav-sidebar li a{
		display: block;
		text-decoration: none;
		color: #A6A6A6;
	}
	.nav-sidebar li a:hover{
		color: #9E9E9E;
		background: #292929;
	}
	.col-md-2 {
	    width: 16.66666667%;
	}
	
	.profile-userpic img {
	  float: none;
	  margin: 0 auto;
	  width: 50%;
	  height: 50%;
	  -webkit-border-radius: 50% !important;
	  -moz-border-radius: 50% !important;
	  border-radius: 50% !important;
	}
	
	.profile-usertitle {
	  text-align: center;
	  margin-top: 20px;
	}
	
	.profile-usertitle-name {
	  color: white;
	  font-size: 16px;
	  font-weight: 600;
	  margin-bottom: 7px;
	}
	
	.profile-usertitle-job {
	  text-transform: uppercase;
	  color: white;
	  font-size: 12px;
	  font-weight: 600;
	  margin-bottom: 15px;
	}
	
	.profile-userbuttons {
	  text-align: center;
	  margin-top: 10px;
	}
	
	.profile-userbuttons .btn {
	  text-transform: uppercase;
	  font-size: 11px;
	  font-weight: 600;
	  padding: 6px 15px;
	  margin-right: 5px;
	}
	
	.profile-userbuttons .btn:last-child {
	  margin-right: 0px;
	}
	
	.main{
		padding-left: 50px;
	}
	
	.page-header{
		font-family: 'Do Hyeon', sans-serif;
		font-weight: 100;
		padding-bottom: 30px;
	}
	
	.placeholders{
		padding-top: 20px;
		padding-bottom: 30px;
	}
	
	h2, .text-muted{
		font-family: 'Do Hyeon', sans-serif;
	}
	
	.text-muted{
		padding-left: 3px;
		font-size: 4em;
	}
	
	.sub-header{
		padding-top: 30px;
	}
	
	hr{
		border: solid 2px gray;
	}

	
</style>

</head>
<body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-expand-lg navbar-dark bg-dark navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Tribee</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#Services">Services</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
   
	
 <div class="container-fluid">
      <div class="row">
      
      <!-- side bar -->
        <div class="col-sm-3 col-md-2 sidebar">
        
        	<!-- SIDEBAR USERPIC -->
        	<div class="profile-userpic">
				<img src="resources/img/new_admin.jpg" class="img-responsive" alt="">
			</div>
			<!-- END SIDEBAR USERPIC -->
			<!-- SIDEBAR USER TITLE -->
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">
					JIEUN
				</div>
				<div class="profile-usertitle-job">
					Admin
				</div>
			</div>
			<!-- END SIDEBAR USER TITLE -->
			<!-- SIDEBAR BUTTONS -->
			<div class="profile-userbuttons">
				<button type="button" class="btn btn-success btn-sm">Follow</button>
				<button type="button" class="btn btn-danger btn-sm">Message</button>
			</div>
			<!-- END SIDEBAR BUTTONS -->
			
          <ul class="nav nav-sidebar">
			<li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Member management</a></li>
            <li><a href="#">Board management</a></li>
            <li><a href="#">... management</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Dash Board</a></li>
            <li><a href="">Chart 1</a></li>
            <li><a href="">One more chart</a></li>
            <li><a href="">Another item</a></li>
          </ul>
        </div>
        
        <!-- 화면 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header text-center">관리자 페이지</h1>
          <hr>

          <div class="row placeholders" style="text-align: center">
            <div class="col-xs-8 col-sm-4 placeholder">
            	<h2>회원수</h2>
              	<img src="resources/img/user1.png" width="120" height="120" class="img-main" alt="USERS">
              	<span class="text-muted">${cilentsCnt }</span>
            </div>
            <div class="col-xs-8 col-sm-4 placeholder">
            	<h2>게시글 수</h2>
              	<img src="resources/img/post3.png" width="120" height="120" class="img-main" alt="POSTS">
              	<span class="text-muted">${boardsCnt }</span>
            </div>
            <div class="col-xs-8 col-sm-4 placeholder">
            	<h2>등록된 국가 수</h2>
              	<img src="resources/img/world1.png" width="120" height="120" class="img-main" alt="COUNTRIES">
              	<span class="text-muted">${contriesCnt }</span>
            </div>
          </div>
          <hr>
          <h2 class="sub-header text-center">무슨 게시판</h2>
          <br>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>Praesent</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>ante</td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td>dapibus</td>
                  <td>diam</td>
                  <td>Sed</td>
                  <td>nisi</td>
                </tr>
                <tr>
                  <td>1,005</td>
                  <td>Nulla</td>
                  <td>quis</td>
                  <td>sem</td>
                  <td>at</td>
                </tr>
                <tr>
                  <td>1,006</td>
                  <td>nibh</td>
                  <td>elementum</td>
                  <td>imperdiet</td>
                  <td>Duis</td>
                </tr>
                <tr>
                  <td>1,007</td>
                  <td>sagittis</td>
                  <td>ipsum</td>
                  <td>Praesent</td>
                  <td>mauris</td>
                </tr>
                <tr>
                  <td>1,008</td>
                  <td>Fusce</td>
                  <td>nec</td>
                  <td>tellus</td>
                  <td>sed</td>
                </tr>
                <tr>
                  <td>1,009</td>
                  <td>augue</td>
                  <td>semper</td>
                  <td>porta</td>
                  <td>Mauris</td>
                </tr>
                <tr>
                  <td>1,010</td>
                  <td>massa</td>
                  <td>Vestibulum</td>
                  <td>lacinia</td>
                  <td>arcu</td>
                </tr>
                <tr>
                  <td>1,011</td>
                  <td>eget</td>
                  <td>nulla</td>
                  <td>Class</td>
                  <td>aptent</td>
                </tr>
                <tr>
                  <td>1,012</td>
                  <td>taciti</td>
                  <td>sociosqu</td>
                  <td>ad</td>
                  <td>litora</td>
                </tr>
                <tr>
                  <td>1,013</td>
                  <td>torquent</td>
                  <td>per</td>
                  <td>conubia</td>
                  <td>nostra</td>
                </tr>
                <tr>
                  <td>1,014</td>
                  <td>per</td>
                  <td>inceptos</td>
                  <td>himenaeos</td>
                  <td>Curabitur</td>
                </tr>
                <tr>
                  <td>1,015</td>
                  <td>sodales</td>
                  <td>ligula</td>
                  <td>in</td>
                  <td>libero</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>