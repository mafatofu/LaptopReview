<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='resources/css/graph.css'/>" />
</head>

<body>
	<canvas id="myChart" class="chart"></canvas>
	<canvas id="myChart2" class="chart"></canvas>
	
	<canvas id="myChart3" class="chart"></canvas>
	<canvas id="myChart4" class="chart"></canvas>
	
	<script>	
	var positive_word = new Array();
	var positive_key = new Array();
	
		<c:forEach var = "pw" items = "${positive_House}">
			<c:if test ="${pw.key eq 'shipping'}">
				<c:forEach var = "pp" items = "${pw.value }"
					varStatus = "idx" begin="0" end="4" step="1">
					positive_key = "${pp.key}",
					positive_word = "${pp.value}",
				</c:forEach>
			</c:if>
		</c:forEach>
		
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'horizontalBar',
		    // The data for our dataset
		    data: {
		    	labels: [positive_key[0],positive_key[1],positive_key[2],positive_key[3],positive_key[4]],
		        datasets: [{
		            label: '긍정단어', 
		            backgroundColor: 'rgb(102, 102, 255)',
		            borderColor: 'rgb(102, 102, 255)',
		            data: [positive_word[0],positive_word[1],positive_word[2],positive_word[3],positive_word[4]]
		        }]
		    },
	
		    // Configuration options go here
		    options: {}
		});
		console.log(positive_key);
		console.log(positive_word);
	</script>

	<script>
		var negative_word = new Array();
		var negative_key = new Array();
		
		<c:forEach var = "nw" items = "${negative_House}">
			<c:if test ="${k == nw.key}">
				<c:forEach var = "nn" items = "${nw.value }"
					varStatus = "idx" begin="0" end="4" step="1">
					negative_key = "${nn.key}",
					negative_word = "${nn.value}",
				</c:forEach>
			</c:if>
		</c:forEach>
		
		var ctx = document.getElementById('myChart2').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'horizontalBar',
		    // The data for our dataset
			    data: {
			    	labels: [negative_key[0],negative_key[1],negative_key[2],negative_key[3],negative_key[4]],
			        datasets: [{
			            label: '부정단어', 
			            backgroundColor: 'rgb(111, 150, 255)',
			            borderColor: 'rgb(120, 150, 255)',
			            data: [negative_word[0],negative_word[1],negative_word[2],negative_word[3],negative_word[4]]
			        }]
			    },
		    // Configuration options go here
		    options: {}
		});
		
		
		var ctx = document.getElementById('myChart3').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'horizontalBar',
		    // The data for our dataset
		    data: {
		    	labels: [positive_key[0],positive_key[1],positive_key[2],positive_key[3],positive_key[4]],
		        datasets: [{
		            label: '긍정단어', 
		            backgroundColor: 'rgb(102, 102, 255)',
		            borderColor: 'rgb(102, 102, 255)',
		            data: [positive_word[0],positive_word[1],positive_word[2],positive_word[3],positive_word[4]]
		        }]
		    },
	
		    // Configuration options go here
		    options: {}
		});
		console.log(positive_key);
		console.log(positive_word);
	</script>

	<script>
		var negative_word = new Array();
		var negative_key = new Array();
		
		<c:forEach var = "nw" items = "${negative_House}">
			<c:if test ="${k == nw.key}">
				<c:forEach var = "nn" items = "${nw.value }"
					varStatus = "idx" begin="0" end="4" step="1">
					negative_key = "${nn.key}",
					negative_word = "${nn.value}",
				</c:forEach>
			</c:if>
		</c:forEach>
		
		var ctx = document.getElementById('myChart4').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'horizontalBar',
		    // The data for our dataset
		    data: {
		    	labels: [positive_key[0],positive_key[1],positive_key[2],positive_key[3],positive_key[4]],
		        datasets: [{
		            label: '긍정단어', 
		            backgroundColor: 'rgb(102, 102, 255)',
		            borderColor: 'rgb(102, 102, 255)',
		            data: [positive_word[0],positive_word[1],positive_word[2],positive_word[3],positive_word[4]]
		        }]
		    },
	
		    // Configuration options go here
		    options: {}
		});
		console.log(positive_key);
		console.log(positive_word);
	</script>

	<script>
		var negative_word = new Array();
		var negative_key = new Array();
		
		<c:forEach var = "nw" items = "${negative_House}">
			<c:if test ="${k == nw.key}">
				<c:forEach var = "nn" items = "${nw.value }"
					varStatus = "idx" begin="0" end="4" step="1">
					negative_key = "${nn.key}",
					negative_word = "${nn.value}",
				</c:forEach>
			</c:if>
		</c:forEach>
		
		console.log(negative_key);
		console.log(negative_word);
	</script>


</body>

</html>