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
  <link href="resources/css/creative.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value='resources/css/index.css?ver=3'/>" />
  <link href="resources/css/main.css?ver=4" rel="stylesheet">
  
  <!-- SearchBox CSS -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	
					
</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-2" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a>
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
	          	<h1 class="text-uppercase font-weight-bold">NoteBook Review Check</h1>
	          	<hr class="divider my-4">
        	</div>
	        <div class="col-lg-10 align-self-baseline mx-auto">
	        	<p class="text-white-75 font-weight-light mb-5">여러 사이트를 통해 수집한 리뷰 데이터들을 분석한 다양한 정보를 얻을 수 있습니다.</p>
	        </div>
	        <div class="s013 col-lg-10 mx-auto my-3">
		      <form action="search">
		        <div class="inner-form">
		          <div class="left">
		           <div class="input-wrap second">
		              <div class="input-field second">
		                <div class="input-select">
		                  <select  name="searchOption">
		                    <option value="MANUFACTURER">제조사</option>
		                    <option value="SERIES">시리즈명</option>
		                    <option value="MODELNAME">모델명</option>
		                  </select>
		                </div>
		              </div>
		            </div>
		            <div class="input-wrap first">
		              <div class="input-field first">
		                <input type="text" placeholder="ex: lg, apple, samsung" name="searchItem" />
		              </div>
		            </div>
		          </div>
		          <button class="btn-search" type="button" onclick="form.submit()">SEARCH</button>
		        </div>
		      </form>
			</div>      
	        <div id="recommend_tag_main" class="col-lg-10 mt-3">
	      	<ul class="row align-items-center justify-content-center">
	        	<li class="tag_li col-lg-3 col-sm-6">
	            	<a href="search?searchItem=lggram">
	                	<div class="img_box">
	                    	<img src="resources/img/lggram.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p font-weight-bold">LG 그램</p> 
	                </a>
	            </li>
	            <li class="tag_li col-lg-3 col-sm-6">
	            	<a href="search?searchItem=apple">
	                	<div class="img_box">
	                    	<img src="resources/img/macbook.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p font-weight-bold">애플 맥북</p>
	                </a>
	            </li>
	        	<li class="tag_li col-lg-3 col-sm-6">
	            	<a href="/search.php?mode=1&q=daily.oasis">
	                	<div class="img_box">
	                    	<img src="resources/img/sam9.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p font-weight-bold">삼성 노트북9</p>
	                </a>
	            </li>                                
	        	<li class="tag_li col-lg-3 col-sm-6">
	            	<a href="/search.php?mode=1&q=daily.oasis">
	                	<div class="img_box">
	                    	<img src="resources/img/ideapad.jpg" class="tag_img">
	                     </div>
	                     <p class="tag_p font-weight-bold">레노버 IdeaPad</p>
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
    <script>
      const choices = new Choices('[data-trigger]',
      {
        searchEnabled: false,
        itemSelectText: '',
      });

    </script>

</body>

</html>

