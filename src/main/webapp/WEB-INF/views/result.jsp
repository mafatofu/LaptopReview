<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- bootstrap-css -->
	<link href="resources/startbootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-css"/>
	<!-- <link rel="stylesheet" type="text/css" href="result.css" /> -->
	<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/result.css'/>" /> 
	
	<!-- jQuery, Popper -->
	<script src="resources/startbootstrap/jquery.slim.min.js"></script>
	<script src="resources/startbootstrap/bootstrap.min.js"></script> <!-- popper 포함 -->
	
	
</head>
<body>
	  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Start Bootstrap</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Portfolio
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Blog
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>
              <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
              <a class="dropdown-item" href="faq.html">FAQ</a>
              <a class="dropdown-item" href="404.html">404</a>
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
    	<div id="wordcloud">
  		
		 <%-- <jsp:include page="wordcloud.jsp" /> --%>
		 
		 <script src="https://d3js.org/d3.v3.min.js"></script>
	    <script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>
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
	<!--<c:forEach var="k" items="${keyWord }">
		${k }
	</c:forEach>-->
	
    <!-- Marketing Icons Section -->
    	
	    <div class="row">
	  	<!-- 키워드 리스트의 사이즈만큼 카드 반복 
	  			사이즈가 n이라고 할 때, n개의 키워드가 n개의 카드에 들어가게 하기
	  			해당 키워드의 인덱스 번호를 graph.jsp 쪽으로 보내기
	  			-->
	  	
	  	<c:forEach var = 'k' items="${keyWord }">	
	  			
	  	</c:forEach>
	      <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">${k}</h4>
	          <div class="card-body"><!-- 그래프가 들어가는 곳 -->
	            <jsp:include page="graph.jsp" />
	          </div>
	          <div class="card-footer">
	            <a href="#" class="btn btn-primary">Learn More</a>
	          </div>
	        </div>
	      </div>
	      
	      
	     <div class="col-lg-4 mb-4">
	        <div class="card h-100">
	          <h4 class="card-header">Card Title</h4>
	          <div class="card-body">
	          	
	            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
	          </div>
	          <div class="card-footer">
	            <a href="#" class="btn btn-primary">Learn More</a>
	          </div>
	        </div>
	      </div>
      
      
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
            <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
            <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
            <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
            <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
            <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
            <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
      
    </div>
    <!-- /.row -->

    <!-- Portfolio Section -->
    <!-- <h2>Portfolio Heading</h2> -->

    <!-- <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project One</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Four</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Five</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Six</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
          </div>
        </div>
      </div>
    </div> -->
    <!-- /.row -->
	
    <!-- Features Section -->
    <!-- <div class="row">
      <div class="col-lg-6">
        <h2>Modern Business Features</h2>
        <p>The Modern Business template by Start Bootstrap includes:</p>
        <ul>
          <li>
            <strong>Bootstrap v4</strong>
          </li>
          <li>jQuery</li>
          <li>Font Awesome</li>
          <li>Working contact form with validation</li>
          <li>Unstyled page elements for easy customization</li>
        </ul>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
      </div>
      <div class="col-lg-6">
        <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
      </div>
    </div> -->
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
   <!--  <div class="row mb-4">
      <div class="col-md-8">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
      </div>
    </div> -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

</body>
</html>