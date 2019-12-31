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

  <title>SB Admin - Blank Page</title>
  <!-- chart -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>	
  
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css?ver=1.2" rel="stylesheet">
  
  
  <!-- wordcloud -->
  <script src="https://d3js.org/d3.v3.min.js"></script>
  <script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>	
  <style>
  	@import url('https://fonts.googleapis.com/css?family=Stylish&display=swap');
  </style>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index">LapView</a>

    <button class="btn btn-link btn-sm text-white order-sm-0">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" action="search">
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
    	<center>
		<div id="wordcloud">
			<jsp:include page="wordcloud.jsp"></jsp:include>
			<h3>Word Cloud</h3>
		</div>
		</center>
		
      <div class="container-fluid">
      <!-- Page Content -->
	      
	<!-- modal -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
	  Launch demo modal
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	<!-- modal end -->
		
		<h1 class="my-4">KeyWord List</h1>
		<!-- Marketing Icons Section -->
		<div class="row">
		<!-- 키워드 개수만큼 그래프 생성 -->
		<c:forEach var='k' items="${keyWord }">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">${k}</h4>
					<div class="card-body">
						<canvas id="${k}" class="chart"></canvas>
						<canvas id="${k}2" class="chart"></canvas>
			<script>	
				//키워드의 상위 5개 긍부정단어 생성
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
				//키워드의 상위 5개 긍부정단어 생성
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


	
  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin.min.js"></script>

</body>

</html>
