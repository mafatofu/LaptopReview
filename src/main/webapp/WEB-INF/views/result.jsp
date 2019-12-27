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

<!-- bootstrap-css -->
<link href="resources/startbootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css" id="bootstrap-css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- <link rel="stylesheet" type="text/css" href="result.css" /> -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='resources/css/result.css'/>" />

<!-- jQuery, Popper -->
<script src="resources/startbootstrap/jquery.slim.min.js"></script>
<script src="resources/startbootstrap/bootstrap.min.js"></script>
<!-- popper 포함 -->


</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">Start Bootstrap</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="services.html">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Portfolio </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="portfolio-1-col.html">1 Column
								Portfolio</a> <a class="dropdown-item" href="portfolio-2-col.html">2
								Column Portfolio</a> <a class="dropdown-item"
								href="portfolio-3-col.html">3 Column Portfolio</a> <a
								class="dropdown-item" href="portfolio-4-col.html">4 Column
								Portfolio</a> <a class="dropdown-item" href="portfolio-item.html">Single
								Portfolio Item</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Blog </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
							<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
							<a class="dropdown-item" href="blog-post.html">Blog Post</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Other Pages </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="full-width.html">Full Width
								Page</a> <a class="dropdown-item" href="sidebar.html">Sidebar
								Page</a> <a class="dropdown-item" href="faq.html">FAQ</a> <a
								class="dropdown-item" href="404.html">404</a> <a
								class="dropdown-item" href="pricing.html">Pricing Table</a>
						</div></li>
				</ul>
			</div>
		</div>
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