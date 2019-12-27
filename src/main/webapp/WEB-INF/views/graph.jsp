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
</head>

<body>
	<canvas id="myChart"  class="chart"></canvas>
	<canvas id="myChart2" class="chart"></canvas>

	<script>
	/*result 단에서 넘어온 키워드와 wordHouse맵의 키값이 같다면, 해당 맵의 value(map) 호출*/
	var positive_word = ${positive_House};
	var negative_word = ${negative_House};
	/* var ck = '<c:out value="${hk}"/>'; */
	
	<c:forEach var = "pw" items = "${positive_House}">
		positive_word.push("${pw}");
	</c:forEach>
	
	<c:forEach var = "nw" items = "${negative_House}">
		negative_word.push("${nw}");
	</c:forEach>
	
	//positive_House와 negative_House map 자바스크립트 변수로 넣음
	for ( var i in positive_word) {
		if(ck == positive_word[i].key){
			alert("성공");
		}
	}
	

	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'horizontalBar',
	    // The data for our dataset
	    data: {
	    	/*긍/부정 해시맵 상위 5개 단어(키)*/
	    	labels: ["1번","2번","3번","4번","5번"],
	        datasets: [{
	            label: '긍정단어', 
	            backgroundColor: 'rgb(255, 99, 132)',
	            borderColor: 'rgb(255, 99, 132)',
	        /*긍/부정 해시맵 상위 5개 갯수(값)*/   
	            data: [5,4,3,2,1]
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
</body>

</html>