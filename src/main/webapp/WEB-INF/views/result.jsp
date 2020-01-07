<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>LapView</title>
  
  <link rel="shortcut icon" href="resources/img/favicon2.ico">
  
  <!-- chart -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>   
  
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css?ver=2.2" rel="stylesheet">
  <link href="resources/css/common.css?ver=1.2" rel="stylesheet">
  
  <!-- ===================JS==================== -->
    <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin.min.js"></script>
  <script src="resources/js/common.js"></script>  
   
  	<script>
		$(document).ready(function(){
			$('a[href*=#]:not([href=#])').click(function(){
				var a = $(this.hash);
				var top = a.offset().top-55;
		        $("html, body").animate({"scrollTop" : top}, 400);
		        console.log('클릭 확인');
			});
		});
	</script>  
    
</head>

<body id="page-top">

  <nav class="navbar-expand navbar-dark bg-dark static-top fixed-top">
    <a class="navbar-brand mr-1" href="index">LapView</a>
    <button class="btn btn-link btn-sm text-white order-sm-0" onclick="$('#div_nav_menu_open').css('display', 'block')">
      <i class="fas fa-bars"></i>
    </button>
    
    <div id = "div_nav_menu_open" style="display: none;">
    	<div class="bg_nav_menu_close" onclick="$('#div_nav_menu_open').css('display','none')"></div>
	    <div class="nav_menu_open">
			<ul>
				<li><a href="#wordcloud">WordCloud</a></li>
				<li id="keyLink"><a href="#keyword_top" >키워드 분석</a></li>
				<li><a href="#">마케팅정보</a></li><!--search.html 페이지의 #marketing-->
				<li><a class="btn_Channel_Plugin" href="#">CONTACT</a></li>
				<li><a href="#">SIGN IN</a></li>
			</ul> 		   
	    </div>    	
    </div>


    <!-- Navbar Search -->
    <form class="_search form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" action="search" onsubmit="return isNull()">
      <div class="input-group">    
        <input type="text" class="form-control" name="searchItem" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>     
    </form>
  </nav>

  <div id="wrapper">
    <div id="content-wrapper">
       <!-- wordCloud -->
      <div id="wordcloud"></div>
      <div class="container-fluid" id="keyword_top">
      <!-- Page Content -->

      <!-- Marketing Icons Section -->
      <div class="row">
      <!-- 키워드 개수만큼 그래프 생성 -->
      <c:forEach var='k'  varStatus = "vs" items="${keyWord }">
         <div class="col-lg-4 mb-4">
            <div class="card h-100">
               <h4 class="card-header">${k}</h4>
               
            <div class="card-body">
               <canvas id="${k}" class="chart"></canvas>
               <canvas id="${k}2" class="chart"></canvas>
         <script>   
            //키워드의 상위 5개 긍정단어 생성
            var positive_word = new Array();
            var positive_key = new Array();
            <c:forEach var = "pw" items = "${positive_House}">
               <c:if test ="${k == pw.key}">
                  <c:forEach var = "pp" items = "${pw.value }"
                      begin="0" end="4" step="1" varStatus="idx">
                      positive_key[${idx.index}] ="${pp.key}",
                      positive_word[${idx.index}] = "${pp.value}",
                  </c:forEach>
               </c:if>
            </c:forEach>
            console.log()
            
            var ctx = document.getElementById('${k}').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'horizontalBar',
                // The data for our dataset
                data: {
                   labels: [
                     positive_key[0],positive_key[1],positive_key[2],positive_key[3],positive_key[4]
                   ],
                    datasets: [{
                        label: '긍정단어', 
                        backgroundColor: 'rgb(205, 092, 092)',
                        borderColor: 'rgb(205, 092, 092)',
                        data: [
                           positive_word[0],positive_word[1],positive_word[2],positive_word[3],positive_word[4]
                           ]
                    }]
                },
                // Configuration options go here
                options: {}
            });
      </script>
      
      <script>   
            //키워드의 상위 5개 부정단어 생성
            var negative_word = new Array();
            var negative_key = new Array();
            <c:forEach var = "nw" items = "${negative_House}">
               <c:if test ="${k == nw.key}">
                  <c:forEach var = "np" items = "${nw.value }"
                      begin="0" end="4" step="1" varStatus="idx">
                      negative_key[${idx.index}] ="${np.key}",
                      negative_word[${idx.index}] = "${np.value}",
                  </c:forEach>
               </c:if>
            </c:forEach>
            console.log()
            
            var ctx = document.getElementById('${k}2').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'horizontalBar',
                // The data for our dataset
                data: {
                   labels: [
                     negative_key[0],negative_key[1],negative_key[2],negative_key[3],negative_key[4]
                   ],
                    datasets: [{
                        label: '부정단어', 
                        backgroundColor: 'rgb(111, 150, 255)',
                        borderColor: 'rgb(120, 150, 255)',
                        data: [
                           negative_word[0],negative_word[1],negative_word[2],negative_word[3],negative_word[4]
                           ]
                    }]
                },
                // Configuration options go here
                options: {}
            });
		
      </script>
      		
   			
               </div>
            </div>
         </div>
         
         <!-- 리뷰파트. -->
	         <div class="col-lg-8 mb-8">
		         <div class="card h-100">
		         	<h4 class="card-header">${k} 리뷰</h4>
		         	<div id = "review">
		   		    <!-- 네비게이션
		   		    	  현재 모델의 키워드 갯수만큼 돌아감.
		   		    	  네비게이션은 positive_WordHouse, negative_WordHouse를 받는다.
		   		    	 pl, nl을 펼쳐 긍부정 상위 5개 단어를 펼친다.
		   		    	  -->
		         	<div id = "reviewNav">
		         		<c:set var = "pl" value = "${positive_WordHouse[vs.index] }"/>
		         		<c:set var = "nl" value ="${negative_WordHouse[vs.index] }"/>
		         		
		         		<%-- <c:set var ="p1" value = "${pl[0]}"/>
		         		<c:out value = "${p1 }"/>  --%>
		         		<div id = "positive_Nav">
 		         		<c:forEach var = "pn" items ="${pl }">
		         			<a href="#positive_review1"><button type="button" class="btn btn-outline-primary slideup">${pn }</button></a>
		         		</c:forEach>
		         		</div>
		         		<div id = "negative_Nav">
 						<c:forEach var = "nn" items ="${nl }">
		         			<a href="#positive_review1"><button type="button" class="btn btn-outline-danger slideleft">${nn }</button></a>
		         		</c:forEach>
		         		</div>	
		         	</div> 
		            <!-- 각 리뷰에 접근하려면, pReviewHouse 안에 있는 리스트를 변수로 받아 출력해야한다. 
		   				현재 모델의 키워드 갯수만큼 돌아감. pWareHouse, nWareHouse 따로 돌리기. for문 2개.
		   				 5번 돌려서 pReviewHouse, nReviewHouse 꺼내기.
		   				  각 ReviewHouse 5번씩 돌려서 pReview, rReview 꺼내기
		   				 n번째 단어 리뷰 자리에 반복문을 돌려 pReview, rReview를 펼친다.
		   				 -->   
		            <div id="review_body">          	
	            		<c:set var = "pReviewHouse" value = "${pWareHouse[vs.index] }"/>
		            	<!-- 키워드 갯수만큼 돌아감. 1번은 9번. -->
            				
	            				<c:forEach var = "p" items="${pReviewHouse }">
	           						<%-- <li>${p}</li> --%>
	           						<ol start = "1" id = "${k }positive_review">
	           						<c:forEach var = "s" items = "${p }" end = "4">
	           							<li>${s }</li>
	           						</c:forEach>
	           						</ol> 
	           					</c:forEach>
           						
		           	</div>
			         	
		         	</div>
		         </div>
	         </div>
	         
         </c:forEach>
      </div>
      
      <!-- /.row -->
      <hr>          

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- wordcloud -->
  <script src="https://d3js.org/d3.v3.min.js"></script>
  <script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"></script>   
  <script src="resources/js/wordcloud.js?ver=1.9	"></script>
  
   

</body>
</html>