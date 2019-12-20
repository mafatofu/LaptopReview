<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/graph.css'/>" /> 
	<style>
		
	</style>
</head>

<body>
	<canvas id="myChart"  class="chart"></canvas>
	<canvas id="myChart2" class="chart"></canvas>
	<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'horizontalBar',

	    // The data for our dataset
	    data: {
	         labels: ['March', 'April', 'May', 'June', 'July'], 
	        datasets: [{
	            label: '부정단어', 
	            backgroundColor: 'rgb(255, 99, 132)',
	            borderColor: 'rgb(255, 99, 132)',
	            data: [0, 2, 200, 30, 45]
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
	         labels: ['March', 'April', 'May', 'June', 'July'], 
	        datasets: [{
	            label: '긍정단어', 
	            backgroundColor: 'rgb(102, 102, 255)',
	            borderColor: 'rgb(102, 102, 255)',
	            data: [123, 72, 3, 30, 45]
	        }]
	    },

	    // Configuration options go here
	    options: {}
	});
	</script>
</body>

</html>