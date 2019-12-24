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
	/*키워드리스트의 인덱스 번호와 긍부정단어장 리스트의 인덱스번호가 같다면, 해당 긍부정단어장 호출*/
	
	//긍정 해쉬맵 키/밸류
	var positive_key = new Array();
	var positive_value = new Array();
	
	<c:forEach var = "p" items = "${positive }" begin="0" end="4" step="1">
		positive_key.push("${p.key}");
		positive_value.push("${p.value}");
	</c:forEach>
	
	
	
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'horizontalBar',
	    // The data for our dataset
	    data: {
	    	/*긍/부정 해시맵 상위 5개 단어(키)*/
	    	labels: [positive_key[0],positive_key[1],positive_key[2],positive_key[3],positive_key[4]],
	        datasets: [{
	            label: '긍정단어', 
	            backgroundColor: 'rgb(255, 99, 132)',
	            borderColor: 'rgb(255, 99, 132)',
	        /*긍/부정 해시맵 상위 5개 갯수(값)*/   
	            data: [positive_value[0],positive_value[1],positive_value[2],positive_value[3],positive_value[4]]
	        }]
	    },

	    // Configuration options go here
	    options: {}
	});
	</script>
	
	<script>
	//부정 해쉬맵 키/밸류
	var negative_key = new Array();
	var negative_value = new Array();
	
	<c:forEach var = "n" items = "${negative }" begin="0" end="4" step="1">
		negative_key.push("${n.key}");
		negative_value.push("${n.value}");
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
	            backgroundColor: 'rgb(102, 102, 255)',
	            borderColor: 'rgb(102, 102, 255)',
	            data: [negative_value[0],negative_value[1],negative_value[2],negative_value[3],negative_value[4]]
	        }]
	    },

	    // Configuration options go here
	    options: {}
	});
	</script>
</body>

</html>