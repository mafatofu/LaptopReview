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
  <link href="resources/css/result.css" rel="stylesheet">
  
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
	
    <script>
	    $(document).ready(function(){
	    	
	    	$('ul.tabs li').click(function(){
	    		var tab_id = $(this).attr('data-tab');
	
	    		$('ul.tabs li').removeClass('current');
	    		$('.tab-content').removeClass('current');
	
	    		$(this).addClass('current');
	    		$("#"+tab_id).addClass('current');
	    	})
	
	    })
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
				<li><a href="#spec_top" >스펙</a></li>
				<li><a href="#wordcloud">WordCloud</a></li>
				<li id="keyLink"><a href="#keyword_top" >키워드 분석</a></li>
				<li><a href="#">가격정보</a></li><!--search.html 페이지의 #marketing-->
				<li><a class="btn_Channel_Plugin" href="#">CONTACT</a></li>
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
		         		<!-- 네비게이션 -->
			         	 <c:set var = "pl" value = "${positive_WordHouse[vs.index] }"/>
					     <c:set var = "nl" value ="${negative_WordHouse[vs.index] }"/>
			         	 <!-- 실제리뷰    -->
			         	 <c:set var = "pReviewHouse" value = "${pWareHouse[vs.index] }"/>
					     <c:set var = "nReviewHouse" value = "${nWareHouse[vs.index] }"/>
			        <!-- 네비게이션-->
		         	<div id = "reviewNav">
		         		<div id = "positive_Nav">
			         		<ul class="tabs">
	 		         		<c:forEach var = "pn" items ="${pl}" varStatus = "status">
	 		         			<c:choose>
	 		         				<c:when test="${status.index eq 0}">
									    <li class="tab-link current" data-tab="tab-${status.index +1}">
									    	<button type="button" id = "${pn }" 
				         				 class="btn btn-outline-primary slideup">${pn }</button>
				         				</li>
			         				</c:when>
			         				<c:otherwise>
			         					<li class="tab-link" data-tab="tab-${status.index +1}"><button type="button" id = "${pn }" 
			         				 class="btn btn-outline-primary slideup">${pn }</button></li>
			         				</c:otherwise>
								</c:choose>
			         		</c:forEach>
			         		</ul>
		         		</div>
		         		<div id = "negative_Nav">
 						<c:forEach var = "nn" items ="${nl }">
		         			<button type="button" id = "nNav" 
		         			class="btn btn-outline-danger slideleft">${nn }</button>
		         		</c:forEach>
		         		</div>	
		         	</div> 	
		         	
		         	<!-- 리뷰 출력 -->  
		         	<!-- 하나의 탭은 5개의 리뷰를 담아야 한다. 알맞게 바꾸자. 하나의 forEach문이 하나의 탭이 됨 -->
		            <div id="review_body">
		            <c:set var = "tcc" value = "tab-content current"/>
		            <c:set var = "tc" value = "tab-content"/>
		            
		            <c:forEach var = "p" items="${pReviewHouse }" varStatus = "status">
		            	
		            	<c:choose>
		            		<!-- 맨 첫번째 긍부정단어의 클래스명만을 바꾼다. -->
		            		
		            			<div id="tab-${status.index +1}" class="tab-content">
		            				<c:when test="">
				           				<c:forEach var = "s" items = "${p }" end = "4" >
					            				<p>${s }</p><br>
					            		</c:forEach>
				            		</c:when>
		           				</div>
		            		
		            		<c:otherwise>
		            			<div id="tab-${status.index +1}" class="tab-content">
			           				<c:forEach var = "s" items = "${p }" end = "4" >
				            				<p>${s }</p><br>
				            		</c:forEach>
		           				</div>
		            		</c:otherwise>
		            	</c:choose>
		            	
		            	
		            	
		            	
		            	
		            	
	           				
	           		</c:forEach>
	           					
		           	<c:forEach var = "n" items="${nReviewHouse }">
   						<ol start = "1" id = "${k }negative_review">
   						<c:forEach var = "s" items = "${n }" end = "4">
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