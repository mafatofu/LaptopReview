<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<script>
var positive_word = new Array();
var positive_key = new Array();

<c:forEach var = "pw" items = "${positive_House}">
	<c:if test ="${k == pw.key}">
		<c:forEach var = "pp" items = "${pw.value }"
			varStatus = "idx" begin="0" end="4" step="1">
			positive_key = "${pp.key}",
			positive_word = "${pp.value}",
		</c:forEach>
	</c:if>
</c:forEach>
window.onload = function () {
		
//Better to construct options first and then pass it as a parameter
var options = {
	title: {
		text: "Column Chart in jQuery CanvasJS"              
	},
	data: [              
	{
		// Change type to "doughnut", "line", "splineArea", etc.
		type: "column",
		dataPoints: [
			{ label: positive_key[0],  y: positive_word[0]  },
			{ label: positive_key[1], y: positive_word[0]  },
			{ label: positive_key[2], y: positive_word[0]  },
			{ label: positive_key[3],  y: positive_word[0]  },
			{ label: positive_key[4],  y: positive_word[0]  }
		]
	}
	]
};
	console.log(positive_key);
	console.log(positive_word);
$("#chartContainer").CanvasJSChart(options);
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>