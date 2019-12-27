<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Charts</title>
	
	<!-- Custom fonts for this template-->
  	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  	<!-- Page level plugin CSS-->
  	<link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  	<!-- Custom styles for this template-->
  	<link href="resources/css/sb-admin.css?ver=1.2" rel="stylesheet">
	
	<!-- bootstrap-css -->
<!-- 	<link href="resources/startbootstrap/bootstrap.min.css" rel="stylesheet"
		type="text/css" id="bootstrap-css" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
	
	<!-- <link rel="stylesheet" type="text/css" href="result.css" /> -->
	<link rel="stylesheet" type="text/css"
		href="<c:url value='resources/css/result.css'/>" />
		
		
	
	<!-- jQuery, Popper -->
	<script src="resources/startbootstrap/jquery.slim.min.js"></script>
	<script src="resources/startbootstrap/bootstrap.min.js"></script>
	
	<!-- Bootstrap core JavaScript-->
  	<script src="resources/vendor/jquery/jquery.min.js"></script>
  	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  	<!-- Core plugin JavaScript-->
  	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  	<!-- Custom scripts for all pages-->
  	<script src="resources/js/sb-admin.min.js"></script>
	<!-- popper 포함 -->


</head>
<body>
	<!-- Navigation -->
	 <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

	<div id="wordcloud">

		<%-- <jsp:include page="wordcloud.jsp" /> --%>

		<script src="https://d3js.org/d3.v3.min.js"></script>
		<script
			src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"
			type="text/JavaScript"></script>
		<script>
	        var width = 960,
	            height = 500
	
	        var svg = d3.select("#wordcloud").append("svg")
	            .attr("width", width)
	            .attr("height", height);
	        d3.csv("resources/text/result_1.LG전자 울트라PC 15U590-GA56K.csv", function (data) {
	            showCloud(data)
	            setInterval(function(){
	                 showCloud(data)
	            },2000) 
	        });
	        //scale.linear: 선형적인 스케일로 표준화를 시킨다. 
	        //domain: 데이터의 범위, 입력 크기
	        //range: 표시할 범위, 출력 크기 
	        //clamp: domain의 범위를 넘어간 값에 대하여 domain의 최대값으로 고정시킨다.
	        wordScale = d3.scale.linear().domain([0, 100]).range([0, 150]).clamp(true);
	        colorScale = d3.scale.linear().domain([0, 100]).range(["#405275", "#fbc280"]).clamp(true);
	        //var keywords = ["자리야", "트레이서", "한조"]
	        var svg = d3.select("svg")
	                    .append("g")
	                    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
	
	        function showCloud(data) {
	            d3.layout.cloud().size([width, height])
	                //클라우드 레이아웃에 데이터 전달
	                .words(data)
	 //               .rotate(function (d) {
	 //               	return d.text.length > 3 ? 0 : 90;
	 //               })
	                //스케일로 각 단어의 크기를 설정
	                .fontSize(function (d) {
	                    return wordScale(d.frequency);
	                })
	                //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
	                .on("end", draw)
	                .start();
	
	            function draw(words) { 
	                var cloud = svg.selectAll("text").data(words)
	                //Entering words
	                cloud.enter()
	                    .append("text")
	                    .style("font-family", 'Stylish')
	                    .style("fill", function (d) {
							return colorScale(d.frequency);
	                    	// return (keywords.indexOf(d.text) > -1 ? "#fbc280" : "#405275");
	                    })
	                    .style("fill-opacity", .5)
	                    .attr("text-anchor", "middle") 
	                    .attr('font-size', 1)
	                    .text(function (d) {
	                        return d.text;
	                    }); 
	                cloud
	                    .transition()
	                    .duration(600)
	                    .style("font-size", function (d) {
	                        return d.size + "px";
	                    })
	                    .attr("transform", function (d) {
	                        return "translate(" + [d.x, d.y] + ")";
	                        //rotate(" + d.rotate + ")";
	                    })
	                    .style("fill-opacity", .9); 
	            }
	        }
	    </script>
		<h3>Word Cloud</h3>
	</div>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">KeyWord List</h1>

		<!-- Marketing Icons Section -->
		<div class="row">
			<c:forEach var='k' items="${keyWord }">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h4 class="card-header">${k}</h4>
						<!-- 그래프 삽입 -->

						<canvas id="myChart" class="chart"></canvas>
						<canvas id="myChart2" class="chart"></canvas>

						<script>
					var positive_word = new Array();
					var negative_word = new Array();
					var p = new Array();
					//positive_House, negative_House 전체가 아닌, 키워드에 해당하는 하나의 맵만을 저장
					
					var ctx = document.getElementById('myChart').getContext('2d');
					var chart = new Chart(ctx, {
					    // The type of chart we want to create
					    type: 'horizontalBar',
					    // The data for our dataset
					    data: {
					    	/*긍/부정 해시맵 상위 5개 단어(키)*/
					    	labels: [
					    	<c:forEach var = "pw" items = "${positive_House}">
								<c:if test ="${k == pw.key}">
									<c:forEach var = "pp" items = "${pw.value }"
										varStatus = "idx" begin="0" end="4" step="1">
											"${pp.key}",
									</c:forEach>
								</c:if>
							</c:forEach>	
					    	],
					        datasets: [{
					            label: '긍정단어', 
					            backgroundColor: 'rgb(255, 99, 132)',
					            borderColor: 'rgb(255, 99, 132)',
					        /*긍/부정 해시맵 상위 5개 갯수(값)*/   
					            data: [
							    	<c:forEach var = "pw" items = "${positive_House}">
									<c:if test ="${k == pw.key}">
										<c:forEach var = "pp" items = "${pw.value }"
											varStatus = "idx" begin="0" end="4" step="1">
												${pp.value},
										</c:forEach>
									</c:if>
								</c:forEach>	   	
					            	]
					        }]
					    },
				
					    // Configuration options go here
					    options: {}
					});
				</script>

						<script>
				var ctx = document.getElementById('myChart2').getContext('2d');
				var chart = new Chart(ctx, {
				    // The type of chart we want to create
				    type: 'horizontalBar',
			
				    // The data for our dataset
				    data: {
				    	labels: ["1번","2번","3번","4번","5번"],
				        datasets: [{
				            label: '부정단어', 
				            backgroundColor: 'rgb(102, 102, 255)',
				            borderColor: 'rgb(102, 102, 255)',
				            data: [1,2,3,4,5]
				        }]
				    },
			
				    // Configuration options go here
				    options: {}
				});
				</script>
						<div class="card-body">
							<!-- 그래프가 들어가는 곳 -->
							<!--<jsp:include page="graph.jsp" />-->
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->
		<hr>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

</body>
</html>