<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
   #float-left{
   	float : left;
   }
   .thumbnail{
      background-color:gray;
      margin:10px;
      width:60px;
      height:60px;
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center center;
    }
    .thumbnail.circle{
      border-radius: 100%;
    }
   .imgs{
      height : 240px;
   }
   .maincontainer{
       position: absolute;
        width: 250px;
        height: 320px;
        background: none;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
   }
   .thecard{
         background: none;
       position: relative;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border-radius: 10px;
        transform-style: preserve-3d;
        transition: all 0.8s ease;
   }
   
   .thecard:hover{
     transform: rotateY(180deg);
   }
   
   .thefront{
     position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     border-radius: 10px;
     backface-visibility: hidden;
     overflow: hidden;
     background: white;
     color: #000;
   }
   .theback{
     position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     border-radius: 10px;
     backface-visibility: hidden;
     overflow: hidden;
     background: #fafafa;
     color: #333;
     text-align: center;
     transform: rotateY(180deg);
   }
   
</style>
<!-- Bootstrap core JavaScript -->
<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/3-col-portfolio.css" rel="stylesheet" type="text/css">
<script>

   var object = new Array();
   
   <c:forEach var = "list" items = "${boardList}">
      var bb_idx = "${list.bb_idx}";
      var hit = "${list.hit}";
      var l_idx = "${list.l_idx}";
      var good = "${list.good}";
      var id = "${list.id}";
      var title = "${list.title}";
      var content = `${list.content}`;
      var regdate = "${list.regdate}";
      var start_date = "${list.start_date}";
      var end_date = "${list.end_date}";
      var place = "${list.place}";
      var nick_name = "${list.nick_name}";
      var country = "${list.country}";
      var address = "${list.address}";
      var latitude = "${list.latitude}";
      var longitude = "${list.longitude}";
      
      var temp = {"bb_idx" : bb_idx , "hit" : hit, "l_idx" : l_idx, "good" : good, "id" : id,
            "title" : title, "regdate" : regdate, "start_date" : start_date,
            "end_date" : end_date, "place" : place, "nick_name" : nick_name, "country" : country,
            "address" : address, "latitude" : latitude, "longitude" : longitude, "content" : content };
      object.push(temp);
   
   </c:forEach>
   
   console.log(object);
   console.log(object.length);
   console.log(object[0].length);


</script>
<script>
   
   $(document).ready(function(){
       
      var mybtns = document.getElementsByClassName("myBtn");
      for(var i = 0; i < mybtns.length; i++){
         console.log(i);
         mybtns[i].onclick = function(){
              
               
               var bb_idx = this.value;
               var m_bb_idx = document.getElementById("m_bb_idx");
               //Object.keys(object).length
               
               //modal에 넣을 변수 선언 부분!!!
               var m_img = document.getElementById("m_img");
               var m_thumb = document.getElementById("m_thumb");
               var m_name = document.getElementById("m_name");
               var m_good = document.getElementById("m_good");
               var m_date = document.getElementById("m_date");
               var m_content = document.getElementById("m_content");
               //modal에 넣을 코드값 선언
               var m_img_stmt = "";
               var m_thumb_stmt = "";
               var m_name_stmt = "";
               var m_good_stmt = "";
               var m_date_stmt = "";
               var m_content_stmt = "";
               
               var result = "";
               result += "<div>"+bb_idx+"</div>";
               console.log(object);
               for(var i = 0; i < object.length; i++){
                  if(object[i]["bb_idx"] == bb_idx){
                     
                     console.log(object[i]);
                     
                     m_img_stmt = "<img id = 'imgs' style = 'width: 680px; height : 640px;' src = 'resources/image/"+object[i]["bb_idx"]+".png' alt='Card image cap'>";
                     m_img.innerHTML = m_img_stmt;
                     
                     m_thumb_stmt = '<div id = "float-left" class = "thumbnail circle" style = "background-image:url('+"'resources/image/"+object[i]["bb_idx"]+".png')"+'"></div>';
                     m_thumb.innerHTML = m_thumb_stmt;
                     
                     m_name_stmt = object[i]["nick_name"];
                     m_name.innerHTML = m_name_stmt;
                     
                     m_good_stmt = "<strong>"+object[i]["good"]+"</strong>";
                     m_good.innerHTML = m_good_stmt;
               		 
                     m_date_stmt = "<strong>"+object[i]["regdate"].substring(0,10)+"</strong>";
                     m_date.innerHTML = m_date_stmt;
                     
                     m_content_stmt = object[i]["content"];
                     m_content.innerHTML = m_content_stmt;
                     for (key in object[i]) {
                         result += "<div>"+key+" : "+ object[i][key] + "</div>";
                         }
                  }                     
               }
               //m_bb_idx.innerHTML = result;
               
               
               $("#myModal").modal();
               
            };
      }
      
      
   });
</script>





<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Tribee</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container" style = "margin-top: 100px">

      <!-- Page Heading -->
      <h1 class="my-4">Tribee Main
        <small>Leave memories</small>
      </h1>
     
      <div class="row">
        <c:forEach var = "board" items = "${boardList }">
           <div class="col-lg-4 col-sm-6 portfolio-item">
             <div class="card h-100" style = "border : none">
               <div class="card-body">
                   <div class = "thecard" style="width: 17rem ; height : 320px">
                      <div class = "thefront">
                         <div class="card" id = "card">
                            <img id = "imgs" class="card-img-top imgs" src = "resources/image/${board.bb_idx }.png" alt="Card image cap">
                         </div>
                         <div class="card-body p-0">
                            <table>
                               <tr>
                                  <td rowspan="3">
                                     <div class="thumbnail circle p-0" style="background-image:url('resources/image/${board.bb_idx }.png')"></div>
                                  </td>
                                  <td><span><strong>${board.place }</strong></span></td>
                               </tr>
                               <tr>
                                  <td><span>${board.nick_name }</span></td>
                               </tr>
                               <tr>
                                  <td><span>${board.regdate }</span></td>
                               </tr>
                               
                         </table>
                         </div>
                      </div>
                            
                      <div class = "theback">
                         <div>${board.title }</div>
                        <div>${board.country }</div>
                        <div>${board.content }</div>
                        
                        <a href = "12">수정</a><br>
                        <a href = "32">삭제</a><br>
                        <button type="button" class="btn btn-info btn-lg myBtn" value = "${board.bb_idx }">상세보기</button>

                      </div>
                      
                   </div>
                   
               </div>
             </div>
           </div>
        
        </c:forEach>
      </div>
      <!-- /.row -->

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>


   <!-- 상세보기 모달 부분 -->
   <!-- Modal -->
      <div class="modal fade" style = "margin-right: 270px; height : auto;" id="myModal" role="dialog">
         <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content" style = "width : 1031px">
               <!-- header 일단 주석 
               <div class="modal-header">
                  
               </div>
                -->
               <div class="modal-body" style = "padding : 0px; heigth : 624px " value = "test">
                   <table class="table border-0" style = "margin-bottom: 0px;">
                      <tr style="height: 80px;">
                         <td rowspan='5' id = "m_img" style = "width: 680px; padding : 0px;  border-top-width: 0px;">이미지</td>
                         <td style = "height : 81px; width: 102px; padding-top: 0px; padding-bottom: 0px;" ><span id = "m_thumb">썸네일</span></td>
                         <td style = "padding-top: 25px;padding-left: 0px;"><span id = "m_name">닉네임</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td><input type = "button" style = "margin-top: 25px; margin-top: 10px;margin-left: 60px;" class="btn btn-primary" value="팔로우"></td>        
                      </tr>
                      <tr>
                         <td colspan = "3" style = "height: 36px;padding-top: 5px;padding-bottom: 0px;">좋아요 <span id = "m_good">84,232</span>개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록일 <span id = "m_date">2018</span></td>
                      </tr>
                      <tr style = "height: 200px;">
                         <td colspan = "3" id = "m_content" style = "border-top-width: 0px;">content</td>
                      </tr>
                      <tr>
                         <td colspan = "3" style="border-top-width: 0px;"><em id = "m_comment">댓글 1,873개 전체 모두 보기</em><br><input type = "button" class = "btn" value = "ajax댓글" onclick = "ajaxComment()"></td>
                      </tr>
                      <tr style="height: 50px;">
                      	<td colspan = "3" style="border-top-width: 0px;">게시글 <a href="#">수정 </a> / <a href="#">삭제</a> &nbsp;<button type="button" class="close" data-dismiss="modal">&times;</button></td>
                      </tr>
                   </table>
               </div>
           
            </div>

         </div>
      </div>
   	
   	
   	<script>
   	setInterval(ajaxComment,5000);
   	
   	function ajaxComment(){
   		//alert("hi");
   		$.ajax("commentList.do",{
			type : "get",
			dataType : "json", //응답결과의 데이터 타입
			success : function(data){
				
				//alert("전달받은 결과값 : "+ data);
				
				var tbody = "";
				//data - {"list" : []}
				var alist = data; //JSON 객체의 속성 "list"의 값
				//alert(alist);
				$.each(alist, function(member){
					tbody += "<tr>";
					tbody += "<td>" + this["c_idx"]  +"</td>"; //JSON객체.속성명 , 여기서 this는 자신이 가리키는 객체(굳이 member를 쓸필요없이 가져옴)
					tbody += "<td>" + this["id"] +"</td>";
					tbody += "<td>" + this["content"]  +"</td>";
					tbody += "<td>" + this["bb_idx"]  +"</td>"; //JSON객체["속성명"]
					tbody += "<td>" + this["regdate"]  +"</td>";
					tbody += "</tr>";
				});
				console.log(tbody);
				$("#m_comment").html(tbody);
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("실패 : \n"
						+"jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : "+ textStatus +"\n"
						+ "errorThrown : "+ errorThrown);
			}
			
		});
   	}
   	
   	
   	
   	
   	
   	</script>
</body>
</html>