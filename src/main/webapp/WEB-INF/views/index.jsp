<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- bootstrap-css -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/bootstrap-4.4.1/dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/index.css?ver=2'/>" />
	<!-- <link rel="stylesheet" type="text/css" href="index.css" /> -->
	<!-- jQuery, Popper -->
	<script src="resources/bootstrap-4.4.1/site/docs/4.4/assets/js/vendor/jquery.slim.min.js"></script>
	<script src="resources/bootstrap-4.4.1/dist/js/bootstrap.min.js"></script> <!-- popper 포함 -->
	
	
</head>

<body>
  
<!-- 네비게이션 -->
<!-- Navigation -->
<!--
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Start Bootstrap</a>
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
  -->

  <div class="container_mk1">
  		<!-- 위쪽 문구 -->
	<div class="d-flex flex-column">
	  <div id="page-content">
	    <div class="container text-center">
	      <div class="row justify-content-center">
	        <div class="col-md-7">
	        	<br><br><br>
	          <h1 class="font-weight-light mt-4 text-white">NoteBook Review Check</h1>
	          <br>
	          <p class="lead text-white-50">여러 사이트를 통해 수집한 리뷰 데이터들을 분석한 다양한 정보를 얻을 수 있습니다.</p>          
	        </div>
	      </div>
	    </div>
	  </div>
	 </div>
  		
      <div class="d-flex justify-content-center h-100">
        <div class="searchbar">        
          <input class="search_input" type="text" name="" placeholder="Search...">
          <a href="#" class="search_icon">
          	<i class="fas fa-search"></i>
          	<img src="resources/image/search.png">
          </a>
        </div>   
      </div>		
    </div>
    
    <br><br>
	<ul class="tagul" id = "tagul" style="overflow: hidden;">
		<li class="tag_li">
			<a href="/search.php?mode=0&amp;q=%EC%BB%A4%ED%94%BC+%EC%B9%B4%ED%8E%98%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8+%EC%B9%B4%ED%8E%98+">
				<div class="img_box">
					<img src="resources/image/lggram.jpg" class="tag_img">
				</div>
				<p class="tag_p">LG 그램</p> 
			</a>
		</li> 
		<li class="tag_li"><a
			href="/search.php?mode=0&amp;q=%EC%9D%BC%EC%83%81%EC%BD%94%EB%94%94+%EC%BD%94%EB%94%94%EC%B6%94%EC%B2%9C+%EB%8D%B0%EC%9D%BC%EB%A6%AC%EC%BD%94%EB%94%94+">
				<div class="img_box">
					<img src="resources/image/macbook.jpg" class="tag_img">
				</div>
				<p class="tag_p">애플 맥북</p> 
		</a></li>
		<li class="tag_li"><a
			href="/search.php?mode=0&amp;q=%EC%9D%8C%EC%8B%9D%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8+%EB%A7%9B%EC%A7%91%EA%B7%B8%EB%9E%A8+%EA%B2%BD%EB%A6%AC%EB%8B%A8%EA%B8%B8%EB%A7%9B%EC%A7%91">
				<div class="img_box" >
					<img src="resources/image/sam9.jpg" class="tag_img">
				</div>
				<p class="tag_p" style="background-color: white;">삼성 노트북9</p> 
		</a></li>
		<li class="tag_li"><a
			href="/search.php?mode=0&amp;q=%ED%99%94%EC%9E%A5%ED%92%88%EC%B6%94%EC%B2%9C+%EB%B7%B0%ED%8B%B0%EA%B7%B8%EB%9E%A8+kbeauty">
				<div class="img_box">
					<img src="resources/image/ideapad.jpg"	class="tag_img">
				</div>
				<p class="tag_p">레노버 IdeaPad</p> 
		</a></li>
	</ul>
	
	  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
	
	<!-- <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    /.container
  </footer> -->
		
</body>

</html>