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

  <title>Creative - Start Bootstrap Theme</title>

  <!-- Font Awesome Icons -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <!-- Plugin CSS -->
  <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
  
  <!-- Theme CSS - Includes Bootstrap -->
  <link href="resources/css/creative.min.css?ver=1.4" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value='resources/css/index.css?ver=1.1'/>" />
  <link href="resources/css/main.css?ver=1.6" rel="stylesheet">
  
  <!-- SearchBox CSS -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	
					
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
	        	<p class="text-white-75 font-weight-light mb-5">다양한 리뷰 데이터들을 분석한 결과를 확인할 수 있습니다.</p>
	        </div>
	        <div class="s013 col-lg-10 align-self-center mx-auto my-3">
		      <form name="search" action="search" onsubmit="return isNull()">
		        <div class="inner-form">
		          <div class="left">
		            <div class="input-wrap first">
		              <div class="input-field first">
		                <input type="text" placeholder="ex: lg, apple, samsung" name="searchItem" />
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
	        	<li class="tag_li col-lg-3 col-sm-6">
	            	<a href="search?searchOption=2&searchItem=그램">
	                	<div class="img_box">
	                    	<img src="resources/img/lggram.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">LG 그램</p> 
	                </a>
	            </li>
	            <li class="tag_li col-lg-3 col-sm-6">
	            	<a href="search?searchOption=2&searchItem=맥북">
	                	<div class="img_box">
	                    	<img src="resources/img/macbook.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">애플 맥북</p>
	                </a>
	            </li>
	        	<li class="tag_li col-lg-3 col-sm-6">
	            	<a href="search?searchOption=2&searchItem=노트북9"">
	                	<div class="img_box">
	                    	<img src="resources/img/sam9.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p">삼성 노트북9</p>
	                </a>
	            </li>                                
	        	<li class="tag_li col-lg-3 col-sm-6">
	            	<a href="search?searchOption=2&searchItem=아이디어패드"">
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

