<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="./js/bootstrap.min.js"></script> 

    <script src = "https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map{
	   height : 400px;
	   width : 400px;
    	}
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .pac-container{
        z-index: 1500 !important;
      }
      input.upload_text {/*읽기전용 인풋텍스트*/
		float:left;
		width:230px;/* 버튼 포함 전체 가로 길이*/
		height:19px;
		line-height:19px;
		padding:0 3px;
		border:1px solid #bbb;
	}
	
	div.upload-btn_wrap input.input_file {/*파일찾기 폼 투명하게*/
		position:absolute;
		top:0;
		right:0;
		cursor:pointer;
		opacity:0;
		filter:alpha(opacity=0);
		-ms-filter:"alpha(opacity=0)";
		-moz-opacity:0;
	}
	div.upload-btn_wrap {/*버튼테두리 감싼 div*/
		overflow:hidden;
		position:relative;
		float:left;
		width:70px;/*width, height 값은 button(찾아보기)값과 같아야함 */
		height:21px;
		padding-left:3px;
	}
	div.upload-btn_wrap button {/*버튼 div*/
		width:70px;
		height:21px;
		font-weight:bold;
		background:#333;
		border:1px solid #333;
		color:#fff;
	}
      
      
</style>
<script src="//cdn.ckeditor.com/4.5.6/standard/ckeditor.js"></script></head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script>
	
		function send_go(){
			alert("hi");
			var form = document.forms[0];
			form.action = "insertBoard.do";
			form.submit();
		}
	
</script>
</head>
<body>
	 
	 <form method = "post" enctype="multipart/form-data">
	 	<table>
	 		<tr>
	 			<td>startdate</td>
	 			<td><input type = "date" name = "start_date"></td>
	 		</tr>
	 		<tr>
	 			<td>enddate</td>
	 			<td><input type = "date" name = "end_date"></td>
	 		</tr>
	 		<tr>
	 			<td>upload</td>
	 			<td><input type = "file" name = "uploadFile" id = "ex_file"></td>
	 		</tr>
	 		
	 		<tr>
				<td>내용</td>
				<td>
				<textarea name="content" id="content" row="100" cols="800">${board.content}</textarea>
						<script>
							CKEDITOR.replace('content');
						</script>
				</td>
			</tr>
	 		<tr>
	 			<td><input type = "button" value = "submit" onclick = "send_go()"></td>
	 			<td><input type = "reset" value = "reset"></td>
	 		</tr>
	 		<td><input type = "hidden" name = "place" id = "place" value = ""></td>
	 		<td><input type = "hidden" name = "country" id = "country" value = ""></td>
	 		<td><input type = "hidden" name = "address" id = "address" value = ""></td>
	 		<td><input type = "hidden" name = "latitude" id = "latitude" value = ""></td>
	 		<td><input type = "hidden" name = "longitude" id = "longitude" value = ""></td>
	 		  
	 	</table>
	 
	 </form>
	 
	 
	 
		<div class = "container">
            <form id = "location-form">
                <input type = "text" id = "location-input" class = "form-control form-control" placeholder = "enter the location">
                <br>
                <button type = "search" class = "btn btn-primary">search</button>
				
            </form>
        </div>    
      
        <div id = "map"></div>
        <script>

            function initMap(){
                
                //Map options
                var options = {
                    zoom:8,
                    center:{lat: 37.552955, lng: 126.937285}
                }
                //new map
                var map = new google.maps.Map(document.getElementById('map'), options);  
                
                /* 클릭시 마커 추가
                google.maps.event.addListener(map, 'click', function(event){
                    // Add marker
                    addMarker({coords:event.latLng});
                    alert(event.latLng);
                });
            	*/
            	
                //function 안에 function !!! 주의해야함
                function addMarker(props){
                    var marker = new google.maps.Marker({
                        position:props.coords,
                        map : map
                        // icon : props.iconImage
                    });

                    //Check for customicon
                    if(props.iconImage){
                        marker.setIcon(props.iconImage);
                    }

                    //Check 
                    if(props.content){
                        var infoWindow = new google.maps.InfoWindow({
                        content : props.content
                        });

                        marker.addListener('click', function(){
                        infoWindow.open(map, marker);
                        })
                    }
                }
            // geocode()

            // get Location form
            var locationForm = document.getElementById('location-form');

            // Listen for submit
            locationForm.addEventListener('submit', geocode);
            
            
            function moveToLocation(lat, lng){
                var center = new google.maps.LatLng(lat, lng);
                map.panTo(center);
            }

            // Call GeoCode 
            function geocode(e){
                //prevent actual submit
                console.log(e);
                e.preventDefault();
                
                var location = document.getElementById('location-input').value;

                axios.get('https://maps.googleapis.com/maps/api/geocode/json',{
                    params : {
                        address : location,
                        key : 'AIzaSyB1UaadWLDBiUcjm6WdQoZTRRc3KxVJJ7Q'
                    }
                }).then(function(response){
                    // Log full response
                    console.log(response);
                    
                    // Formatted Address
                    console.log(response.data.results[0].formatted_address);
                    var formattedAddress = response.data.results[0].formatted_address;
                  	console.log("formattedAddress : "+formattedAddress);
                    
                    // Address Components
                    var addressComponents = response.data.results[0].address_components;
                    var country = "";
                    for(var i = 0; i < addressComponents.length; i++){
                    	console.log(addressComponents[i].types[0]+" : "+addressComponents[i].long_name);    
                    	if(addressComponents[i].types[0] == "country"){
                    		country = addressComponents[i].long_name;
                    	}
                    }
                 


                    // Geometry
                    var lat = response.data.results[0].geometry.location.lat;
                    var lng = response.data.results[0].geometry.location.lng;
                    
                    
                    
                    //여기 form에 db에 들어갈 값들을 넣어주는 코드
                    var place = document.getElementById('location-input').value;
                    console.log("place : "+place );
                    document.getElementById('place').value = place;
                    
                    console.log("country : "+country );
                    document.getElementById('country').value = country;
                    
                    console.log("address : "+formattedAddress );
                    document.getElementById('address').value = formattedAddress;
                    
                    //////////////////////////////////////
                    var props = {coords : {lat : lat, lng : lng}};
                    console.log(props);
                    console.log();
                    addMarker(props);
                    moveToLocation(lat,lng);
                    //////////////////////////////////////
					console.log("lat : "+lat);
					console.log("lng : "+lng);
                    //Output to app
					document.getElementById('latitude').value = lat;
					document.getElementById('longitude').value = lng;
                    
                })
                .catch(function(error){
                    console.log(error);
                })
            }


            }
            
        </script>
        
        
        
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1UaadWLDBiUcjm6WdQoZTRRc3KxVJJ7Q&callback=initMap"
        async defer></script>
</body>
</html>