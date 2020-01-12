<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>LapView</title>
  
  <link rel="shortcut icon" href="resources/img/favicon2.ico">

  <!-- Font Awesome Icons -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <!-- Plugin CSS -->
  <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
  
  <!-- Theme CSS - Includes Bootstrap -->
  <link href="resources/css/creative.min.css?ver=1.6" rel="stylesheet">
  <link href="resources/css/index.css?ver=1.5" rel="stylesheet">
  <link href="resources/css/main.css?ver=1.6" rel="stylesheet">
  
					
</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-2" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">LapView</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#portfolio">Portfolio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead">
  	<div class="container h-100">
    	<div class="row h-100 align-items-center justify-content-center text-center">
        	<div class="text-white col-lg-10 align-self-end">
	          	<h1 class="text-uppercase font-weight-bold">LapView</h1>
	          	<hr class="divider my-4">
        	</div>
	        <div class="col-lg-10 align-self-baseline mx-auto">
	        	<p class="text-white-75 font-weight-light mb-5">노트북 리뷰 데이터 분석 결과를 확인하세요</p>
	        </div>
	        <div class="s013 col-lg-10 align-self-center mx-auto my-3">
		      <form name="search" action="search" onsubmit="return isNull()">
		        <div class="inner-form">
		          <div class="left">
		            <div class="input-wrap first">
		              <div class="input-field first">
		                <input type="text" placeholder=" ex: lg, apple, samsung" name="searchItem" />
		              </div>
		            </div>
		          </div>
		          <button class="btn-search">SEARCH</button>
		        </div>
		      </form>
			</div>      
	        <div id="recommend_tag_main" class="col-lg-10 mt-3">
	        <hr class="divider-2 my-5">
	      	<ul class="row align-items-center justify-content-center">
	        	<li class="tag_li col-lg-3 col-xs-6">
	            	<a href="search?searchItem=그램">
	                	<div class="img_box">
	                    	<img src="resources/img/lggram.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">LG 그램</p> 
	                </a>
	            </li>
	            <li class="tag_li col-lg-3 col-xs-6">
	            	<a href="search?searchItem=맥북">
	                	<div class="img_box">
	                    	<img src="resources/img/macbook.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">애플 맥북</p>
	                </a>
	            </li>
	        	<li class="tag_li col-lg-3 col-xs-6">
	            	<a href="search?searchItem=노트북9"">
	                	<div class="img_box">
	                    	<img src="resources/img/sam9.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">삼성 노트북9</p>
	                </a>
	            </li>                                
	        	<li class="tag_li col-lg-3 col-xs-6">
	            	<a href="search?searchItem=아이디어패드"">
	                	<div class="img_box">
	                    	<img src="resources/img/ideapad2.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">레노버 IdeaPad</p>
	                </a>
	            </li>                            
	  		</ul>
	  		</div>
    	</div>
  	</div>
  </header>
  
  <!-- about Section -->
  <section class="page-section" id="about">
    <div class="container">
      <h2 class="text-center mt-0 font-weight-bold">리뷰 분석?</h2>
      <hr class="divider my-4">
      <div class="row">
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="material-icons md-70">all_inbox</i>
            <h3 class="h4 mb-2">다양한 리뷰 데이터</h3>
            <p class="text-muted mb-0">모델당 수백건의 리뷰 데이터를 수집합니다</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
            <h3 class="h4 mb-2"></h3>
            <p class="text-muted mb-0">수집한 리뷰 데이터들을 한글 형태소 분석기를 통해 분석합니다</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-globe text-primary mb-4"></i>
            <h3 class="h4 mb-2">Ready to Publish</h3>
            <p class="text-muted mb-0">You can use this design as is, or you can make changes!</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-heart text-primary mb-4"></i>
            <h3 class="h4 mb-2">Enjoy it</h3>
            <p class="text-muted mb-0">Is it really open source if it's not made with love?</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-light py-1">
    <div class="container">
      <div class="small text-center text-muted">Copyright &copy; 2019 - Start Bootstrap</div>
    </div>
  </footer>


  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="resources/js/creative.min.js"></script>
  <script src="resources/js/extention/choices.js"></script>
  <script src="resources/js/common.js"></script>

  
</body>

</html>

